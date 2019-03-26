//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import class Foundation.NSString
import class Foundation.NSRegularExpression
import struct Foundation.Data
import struct Foundation.NSRange
import class Foundation.NSTextCheckingResult

/**
 A DSL for String to access custom methods
*/
public struct KioStringDSL {

    // MARK: Stored Propeties
    /**
     Underlying String instance
    */
    public let string: String

}

public extension KioStringDSL {
    /**
     Checks if string contains a number
    */
    var containsNumbers: Bool {
        let regex: String = "[0-9]+"
        let range: Range<String.Index>? = self.string.range(of: regex, options: String.CompareOptions.regularExpression)
        return range != nil
    }

    /**
     Checks if string contains an alphabetic character
    */
    var isAlphabetic: Bool {
        let regex: String = "^[a-zA-Z]+$"
        let range: Range<String.Index>? = self.string.range(of: regex, options: String.CompareOptions.regularExpression)
        return range != nil
    }

    /**
     Checks if string is a valid email address
    */
    var isValidEmail: Bool {
        let regex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let range: Range<String.Index>? = self.string.range(of: regex, options: String.CompareOptions.regularExpression)
        return range != nil
    }

    /**
     Checks if string is a valid phone number
    */
    var isValidPhoneNum: Bool {
        let regex: String = "^[0-9]{3}-[0-9]{3}-[0-9]{4}$"
        let range: Range<String.Index>? = self.string.range(of: regex, options: String.CompareOptions.regularExpression)
        return range != nil
    }

    /**
     Returns the string as a base64 encoded string
    */
    var base64Encoded: String? {
        let encodedData: Data? = self.string.data(using: String.Encoding.utf8)
        return encodedData?.base64EncodedString()
    }

    /**
     Returns the string as a base64 decoded string if it was base64 encoded
    */
    var base64Decoded: String? {
        let base64Regex: String = "^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{4}|[A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)$"
        let range: Range<String.Index>? = self.string.range(of: base64Regex, options: NSString.CompareOptions.regularExpression)
        if range != nil {
            guard
                let decodedData = Data(base64Encoded: self.string),
                let decodedString = String(data: decodedData, encoding: String.Encoding.utf8)
            else { return nil }

            return decodedString
        } else {
            return nil
        }
    }

    /**
     Returns the string's ASCII value
    */
    var asciiValue: String? {
        let regexPattern: String = "(0x)?([0-9a-f]{2})"

        do {

            let regex: NSRegularExpression = try NSRegularExpression(
                pattern: regexPattern,
                options: NSRegularExpression.Options.caseInsensitive
            )

            let nsString: NSString = self.string as NSString
            let characters: [Character] = regex
                .matches(in: self.string, options: [], range: NSRange(location: 0, length: nsString.length)).lazy
                .compactMap { UInt32(nsString.substring(with: $0.range(at: 2)), radix: 16) }
                .compactMap(UnicodeScalar.init)
                .compactMap(Character.init)

            switch characters.isEmpty {
                case true:
                    return nil

                case false:
                    return String(characters)
            }

        } catch {
            print(error)
            return nil
        }
    }

    /**
     Checks if the string is a hex value
    */
    var isHexValue: Bool {
        let regexPattern: String = "[0-9A-F]+"
        let range = self.string.range(of: regexPattern, options: NSString.CompareOptions.regularExpression)
        return range != nil
    }

    /**
     Returns the string's hex value
    */
    var hexValue: String? {
        guard let data = self.string.data(using: String.Encoding.utf8) else { return nil }
        return data.map { String(format: "%02hhx", $0) }.joined()
    }

}

public extension String {

    /**
     KioDoubleDSL instance to access custom methods
    */
    var kio: KioStringDSL {
        return KioStringDSL(string: self)
    }
}
