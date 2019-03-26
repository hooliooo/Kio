//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import class Foundation.FileManager
import struct Foundation.URL
import struct Foundation.Data
import class Foundation.JSONEncoder
import class Foundation.JSONDecoder
import class Foundation.NSKeyedUnarchiver
import class Foundation.NSKeyedArchiver

/**
 The KioArchiveManager archives/unarchives Codable objects from the file system.
*/
public class KioArchiveManager: KioObject {

    // MARK: Enums
    /**
     An Archive Error is an error that may occur during archiving/unarchiving of a Codable object.
    */
    public enum ArchiveError: Swift.Error {
        /**
         Represents an error during archiving.
        */
        case archiveError(String)

        /**
         Represents an error during unarchiving.
        */
        case unarchiveError(String)
    }

    // MARK: Initializer
    /**
     Initializer for a JAArchiveManager instance.
     - parameter directory: The directory where files will be archived/unarchived. Default is the Documents Directory.
     - parameter domainMask: The domain mask where where files will be archived/unarchived. Default is User Domain Mask.
     - parameter fileManager: The FileManager instance to be used. Default is the FileManager.default singleton.
    */
    public init(
        directory: FileManager.SearchPathDirectory = FileManager.SearchPathDirectory.documentDirectory,
        domainMask: FileManager.SearchPathDomainMask = FileManager.SearchPathDomainMask.userDomainMask,
        fileManager: FileManager = FileManager.default
    ) {
        self.directory = directory
        self.domainMask = domainMask
        self.fileManager = fileManager
        super.init()
    }

    // MARK: Stored Property
    /**
     Directory where all archiving/unarchiving will occur.
    */
    private final let directory: FileManager.SearchPathDirectory

    /**
     Domain where all archiving/unarchiving will occur.
    */
    private final let domainMask: FileManager.SearchPathDomainMask

    /**
     FileManager instance.
    */
    private final let fileManager: FileManager

    // MARK: Computed Properties
    /**
     The URL to the directory where archiving and unarchiving will occur.
    */
    public final var directoryURL: URL {
        return self.fileManager.urls(
            for: self.directory,
            in: self.domainMask
        )[0]
    }

    // MARK: Instance Methods
    /**
     Saves the Codable object to the directory specified by the directoryURL property.
     First, the object is encoded as Data with a JSONEncoder, then saved to the directory
     specified by the directoryURL property.

     Throws an error if something went wrong with the encoding/archiving.
     - parameter object: The object to be persisted to the disk.
     - parameter fileName: The file name of the object when it is persisted to the disk.
    */
    public func archive<T: Codable>(object: T, as fileName: String) throws {
        let encoder: JSONEncoder = JSONEncoder()
        let data: Data = try encoder.encode(object)

        let path: String = self.directoryURL.appendingPathComponent(fileName).path

        switch NSKeyedArchiver.archiveRootObject(data, toFile: path) {
            case true:
                break

            case false:
                throw ArchiveError.archiveError("Archiving Failed.")
        }
    }

    /**
     Creates a Codable object from the specified file.
     First, The Data in unarchived the file in the directory specified by the directoryURL
     then decoded with a JSONDecoder and returns the Codable object.

     Throws an error if something went wrong with the unarchiving/decoding.
     - parameter fileName: The file name of the object to be unarchived.
    */
    public func unarchive<T: Codable>(objectFrom fileName: String) throws -> T {

        let path: String = self.directoryURL.appendingPathComponent(fileName).path

        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? Data
            else { throw ArchiveError.unarchiveError("Unarchiving couldn't typecast to Data") }
        let decoder: JSONDecoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }

    /**
     Checks if file exist in the direcorty specified by the directoryURL. Returns a Bool.
     - parameter name: Name of the file.
    */
    public final func fileExists(with name: String) -> Bool {
        let path: String = self.directoryURL.appendingPathComponent(name).path
        return self.fileManager.fileExists(atPath: path)
    }

}
