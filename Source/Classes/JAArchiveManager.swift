//
//  Rapid
//  Copyright (c) 2017 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

public class JAArchiveManager: JAObject {

    // MARK: Enums
    public enum ArchiveError: Swift.Error {
        case archiveError(String)
        case unarchiveError(String)
    }

    // MARK: Computed Properties
    /**
     The URL to the Documents Directory
    */
    private final var documentsDirectoryURL: URL {
        return FileManager.default.urls(
            for: FileManager.SearchPathDirectory.documentDirectory,
            in: FileManager.SearchPathDomainMask.userDomainMask
        )[0]
    }

    // MARK: Instance Methods
    /**
     This method saves the Encodable object to the documents directory of the device.
     First, JAArchiveManager encodes the object with a JSONEncoder, then saves the Data instance to the disk
     with the specified file name in the Documents Directory.
     Throws an error if something went wrong with the encoding/archiving.
     - parameter object: The object to be persisted to the disk
     - parameter fileName: The file name of the object when it is persisted to the disk
    */
    public func archive<T: Encodable>(object: T, asFileName fileName: String) throws {
        let encoder: JSONEncoder = JSONEncoder()
        let data: Data = try encoder.encode(object)

        let path: String = self.documentsDirectoryURL.appendingPathComponent(fileName).path

        switch NSKeyedArchiver.archiveRootObject(data, toFile: path) {
            case true:
                break

            case false:
                throw ArchiveError.archiveError("Archiving Failed.")
        }
    }

    /**
     This method creates an instance of the Decodable object from the data used in the specified file name.
     First, JAArchiveManager unarchives a Data instance from the file in the Documents Directory then decodes the Data with
     a JSONDecoder.
     Throws an error if something went wrong with the unarchiving/decoding
     - parameter fileName: The file name of the object to be unarchived.
    */
    public func unarchive<T: Decodable>(fromFileName fileName: String) throws -> T {

        let path: String = self.documentsDirectoryURL.appendingPathComponent(fileName).path

        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? Data
            else { throw ArchiveError.unarchiveError("Unarchiving couldn't typecast to Data") }
        let decoder: JSONDecoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }

}
