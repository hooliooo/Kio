//
//  Rapid
//  Copyright (c) 2017 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//
import Foundation

/**
 A DSL for Date to access custom methods
*/
public struct RapidDateDSL {

    // MARK: Static Properties
    /**
     UTC TimeZone instance
    */
    fileprivate static let timeZone: TimeZone = TimeZone(identifier: "UTC")!

    /**
     Calendar Instance
    */
    fileprivate static let calendar: Calendar = {
        var calendar: Calendar = Calendar.autoupdatingCurrent
        calendar.firstWeekday = 0
        calendar.timeZone = RapidDateDSL.timeZone
        return calendar
    }()

    // MARK: Stored Propeties
    /**
     Underlying Date instance
    */
    let date: Date

}

public extension RapidDateDSL {
    /**
     Returns the 0:00 Date of the underlying Date. In UTC TimeZone.
    */
    var startOfDay: Date {
        return RapidDateDSL.calendar.startOfDay(for: self.date)
    }

    /**
     Returns the 23:59 Date of the underlying Date. In UTC TimezZone
    */
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return RapidDateDSL.calendar.date(byAdding: components, to: self.startOfDay)!
    }

    /**
     Returns the Sunday Date of the week of the underlying Date. In UTC TimeZone.
    */
    var startDateOfCurrentWeek: Date {
        let currentDateComponents: DateComponents = RapidDateDSL.calendar.dateComponents(
            [.yearForWeekOfYear, .weekOfYear],
            from: self.date
        )

        return RapidDateDSL.calendar.date(from: currentDateComponents)!
    }
}

public extension Date {
    /**
     RapidDateDSL instance to access custom methods
    */
    var rpd: RapidDateDSL {
        return RapidDateDSL(date: self)
    }
}
