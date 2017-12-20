//
//  Rapid
//  Copyright (c) 2017 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

/**
 The JAFileManager class is responsible for simple CRUD operations on files saved to the
 Documents Directory.
*/
open class JAFileManager: JAObject {

    // MARK: Stored Properties
    /**
     The FileManager instance.
    */
    private unowned let fileManager: FileManager = FileManager.default

    // MARK: Computed Properties
    /**
     The URL to the Documents Directory.
    */
    public final var documentsDirectoryURL: URL {
        return self.fileManager.urls(
            for: FileManager.SearchPathDirectory.documentDirectory,
            in: FileManager.SearchPathDomainMask.userDomainMask
        )[0]
    }

    // MARK: Instance Methods
    /**
     Searches the Documents Directory for files that contain the specified name.
     - parameter name: The specified name used to search for files in Document Directory.
    */
    public final func filesContaining(name: String) -> [String] {
        guard
            let files = try? self.fileManager
                .contentsOfDirectory(atPath: self.documentsDirectoryURL.path)
                .filter({ (fileName: String) -> Bool in
                    return fileName.contains(name)
                })
        else {
            return []
        }

        return files
    }

    /**
     Deletes files in the Document Directory that contains the specified name.
     - parameter name: The specified name used to find and delete files in Document Directory.
    */
    public final func deleteFilesContaining(name: String) {
        let fileNames: [String] = self.filesContaining(name: name)

        fileNames.forEach { [weak self] (fileName: String) -> Void in
            guard let `self` = self else { return }
            let filePath: String = self.documentsDirectoryURL.appendingPathComponent(fileName).path

            try? self.fileManager.removeItem(atPath: filePath)
        }
    }

    /**
     Retrieves the data from a URL and save the data as a file in the Documents Directory with the specified name and format.
     Returns the new file's URL.

     - parameter url: The current location of the file to be saved to the Documents Directory.
     - parameter fileName: The name the data will be labelled as when saved to the Documents Directory.
     - parameter pathExtension:  The specified format of the data.
    */
    public final func save(fileFrom url: URL, asFileName fileName: String, withPathExtension pathExtension: String) throws -> URL {

        let fileData = try Data(contentsOf: url)

        let newFileURL: URL = self.documentsDirectoryURL
            .appendingPathComponent(fileName)
            .appendingPathExtension(pathExtension)

        try fileData.write(to: newFileURL)

        return newFileURL

    }

    /**
     Saves the data as a file in the Documents Directory with the specified name and format.
     Returns the new file's URL.
     - parameter data: The data to be saved to the Documents Directory.
     - parameter fileName: The name the data will be labelled as when saved to the Documents Directory.
     - parameter pathExtension:  The specified format of the data.
    */
    public final func save(data: Data, asFileName fileName: String, withPathExtension pathExtension: String) throws -> URL {

        let newFileURL: URL = self.documentsDirectoryURL
            .appendingPathComponent(fileName)
            .appendingPathExtension(pathExtension)

        try data.write(to: newFileURL)
        return newFileURL
    }

    /**
     Deletes the file at the specified URL.
     - parameter url: URL of the file to be deleted.
    */
    public final func delete(fileAtURL url: URL) throws {
        try self.fileManager.removeItem(atPath: url.path)
    }

    /**
     Reads the data at the specified URL.
     - parameter url: URL of the file to be read.
    */
    public final func data(from url: URL) throws -> Data {
        return try Data(contentsOf: url)
    }

    /**
     Return URL of the specified file if it exists, otherwise returns nil.
     - parameter fileName: Name of the file.
     - parameter pathExtension: Path extension of file.
    */
    public final func url(ofFileName fileName: String, withPathExtension pathExtension: String) -> URL? {
        let fileURL: URL = self.documentsDirectoryURL
            .appendingPathComponent(fileName)
            .appendingPathExtension(pathExtension)

        switch self.fileManager.fileExists(atPath: fileURL.path) {
            case true:
                return fileURL

            case false:
                return nil
        }
    }

}
