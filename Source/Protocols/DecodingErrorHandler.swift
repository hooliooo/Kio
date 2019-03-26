//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

public protocol DecodingErrorHandler {

    func handle(decodingError error: DecodingError) -> Never

}

public extension DecodingErrorHandler {

    func handle(decodingError error: DecodingError) -> Never { // this warning is a compiler bug 1/23/18
        switch error {
            case .dataCorrupted(let context):
                fatalError(context.debugDescription)

            case .keyNotFound(let key, let context):
                fatalError("Key not found: \(key) \(context.debugDescription)")

            case .typeMismatch(let type, let context):
                fatalError("Type mismatch: \(type) \(context.debugDescription)")

            case .valueNotFound(let type, let context):
                fatalError("Value not found: \(type) \(context.debugDescription)")
            @unknown default:
                fatalError("Unknown Error")
        }

        print(error)

    }

}
