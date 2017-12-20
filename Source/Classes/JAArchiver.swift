//
//  Rapid
//  Copyright (c) 2017 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

public class JAArchiveManager {

    public enum ArchiveError: Swift.Error {
        case archiveError(String)
        case unarchiveError(String)
    }

    public func archive<T: Encodable>(object: T, asFileName fileName: String) throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(object)

        switch NSKeyedArchiver.archiveRootObject(data, toFile: fileName) {
            case true:
                break

            case false:
                throw ArchiveError.archiveError("Archiving Failed.")
        }
    }

    public func unarchive<T: Decodable>(fromFileName fileName: String) throws -> T {
        let decoder: JSONDecoder = JSONDecoder()
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: fileName) as? Data
            else { throw ArchiveError.unarchiveError("Unarchiving couldn't typecast to Data") }

        return try decoder.decode(T.self, from: data)
    }

}
