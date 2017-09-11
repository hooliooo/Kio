//
//  Rapid
//  Copyright (c) 2017 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation
import SystemConfiguration

public final class Reachability: JAObject {

    // MARK: Static Properties
    // swiftlint:disable:next line_length
    public static let ReachabilityDidChangeNotification: Notification.Name = Notification.Name("ReachabilityDidChangeNotificationName")

    // MARK: Static Methods
    public static func networkReachabilityForInternetConnection() -> Reachability? {
        var zeroAddress: sockaddr_in = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        return Reachability(hostAddress: zeroAddress)
    }

    public static func networkReachabilityForLocalWifi() -> Reachability? {
        var localWifiAddress: sockaddr_in = sockaddr_in()
        localWifiAddress.sin_len = UInt8(MemoryLayout.size(ofValue: localWifiAddress))
        localWifiAddress.sin_family = sa_family_t(AF_INET)
        // IN_LINKLOCALNETNUM is defined in <netinet/in.h> as 169.254.0.0 (0xA9FE0000).
        localWifiAddress.sin_addr.s_addr = 0xA9FE0000

        return Reachability(hostAddress: localWifiAddress)
    }

    // MARK: Enums
    public enum Status {
        case notReachable
        case reachableViaWifi
        case reachableViewWWAN
    }

    // MARK: Initializer
    public init?(hostName: String) {
        guard
            let hostName = (hostName as NSString).utf8String,
            let reachability = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, hostName)
        else {
            return nil
        }

        self.networkReachability = reachability
        super.init()
    }

    public init?(hostAddress: sockaddr_in) {
        var address: sockaddr_in = hostAddress

        // swiftlint:disable:next line_length
        guard let defaultRouteReachability = withUnsafePointer(to: &address, { (pointeeOne: UnsafePointer<sockaddr_in>) -> SCNetworkReachability? in
            // swiftlint:disable:next line_length
            pointeeOne.withMemoryRebound(to: sockaddr.self, capacity: 1) { (pointeeTwo: UnsafePointer<sockaddr>) -> SCNetworkReachability? in
                return SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, pointeeTwo)
            }
        }) else {
            return nil
        }

        self.networkReachability = defaultRouteReachability
        super.init()
    }

    deinit {
        self.stopNotifying()
    }

    // MARK: Stored Properties
    private var networkReachability: SCNetworkReachability
    private var isNotifying: Bool = false

    // MARK: Computed Properties
    private var flags: SCNetworkReachabilityFlags {
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)

        if withUnsafeMutablePointer(to: &flags, { SCNetworkReachabilityGetFlags(self.networkReachability, UnsafeMutablePointer<SCNetworkReachabilityFlags>($0))}) == true {
            return flags
        } else {
            return []
        }
    }

    public var status: Reachability.Status {
        let isConnectionOnDemandOrTraffic: Bool = self.flags.contains(SCNetworkReachabilityFlags.connectionOnDemand) == true ||
            self.flags.contains(SCNetworkReachabilityFlags.connectionOnTraffic) == true

        let isInterventionNotRequired: Bool = self.flags.contains(SCNetworkReachabilityFlags.interventionRequired) == false

        if self.flags.contains(SCNetworkReachabilityFlags.reachable) == false {

            return Reachability.Status.notReachable

        } else if self.flags.contains(SCNetworkReachabilityFlags.isWWAN) == true {

            return Reachability.Status.reachableViewWWAN

        } else if self.flags.contains(SCNetworkReachabilityFlags.connectionRequired) == false {

            return Reachability.Status.reachableViaWifi

        } else if isConnectionOnDemandOrTraffic && isInterventionNotRequired {

            return Reachability.Status.reachableViaWifi

        } else {

            return Reachability.Status.notReachable

        }
    }

    public var isReachable: Bool {
        switch self.status {
            case .notReachable:
                return false

            case .reachableViaWifi, .reachableViewWWAN:
                return true
        }
    }

    // MARK: Instance Mehthods
    public func startNotifying() -> Bool {
        guard self.isNotifying == false else {
            return false
        }

        var context: SCNetworkReachabilityContext = SCNetworkReachabilityContext()
        context.info = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
        // swiftlint:disable:next unused_closure_parameter  line_length
        guard SCNetworkReachabilitySetCallback(self.networkReachability, { (target: SCNetworkReachability, _: SCNetworkReachabilityFlags, info: UnsafeMutableRawPointer?) -> Void in
            if let currentInfo = info {
                let infoObject: AnyObject = Unmanaged<AnyObject>.fromOpaque(currentInfo).takeUnretainedValue()

                if let reachability = infoObject as? Reachability {
                    NotificationCenter.default.post(name: Reachability.ReachabilityDidChangeNotification, object: reachability)
                }
            }
        }, &context) == true else { return false }

        guard SCNetworkReachabilityScheduleWithRunLoop(
            self.networkReachability,
            CFRunLoopGetCurrent(),
            CFRunLoopMode.defaultMode.rawValue
        ) == true
        else { return false }

        self.isNotifying = true

        return self.isNotifying
    }

    public func stopNotifying() {
        switch self.isNotifying {
            case true:
                SCNetworkReachabilityUnscheduleFromRunLoop(
                    self.networkReachability,
                    CFRunLoopGetCurrent(),
                    CFRunLoopMode.defaultMode.rawValue
                )
            case false:
                break
        }
    }

}
