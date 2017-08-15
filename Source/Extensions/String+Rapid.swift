//
//  Rapid
//  Copyright (c) 2017 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 A DSL for String to access custom methods
*/
public struct RapidStringDSL {

    // MARK: Stored Propeties
    /**
     Underlying String instance
    */
    let string: String

}

public extension RapidStringDSL {
    /**
     Checks if string contains a number
    */
    var containsNumbers: Bool {
        let numRegex = "[0-9]+"
        let range = self.string.range(of: numRegex, options: String.CompareOptions.regularExpression)
        return range != nil
    }

    /**
     Checks if string contains an alphabetic character
    */
    var isAlphabetic: Bool {
        let alphaRegex = "^[a-zA-Z]+$"
        let range = self.string.range(of: alphaRegex, options: String.CompareOptions.regularExpression)
        return range != nil
    }

    /**
     Checks if string is a valid email address
    */
    var isValidEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let range = self.string.range(of: emailRegex, options: String.CompareOptions.regularExpression)
        return range != nil
    }

    /**
     Checks if string is a valid phone number
    */
    var isValidPhoneNum: Bool {
        let phoneRegex = "^[0-9]{3}-[0-9]{3}-[0-9]{4}$"
        let range = self.string.range(of: phoneRegex, options: String.CompareOptions.regularExpression)
        return range != nil
    }

    /**
     Returns the string as a base64 encoded string
    */
    var base64Encoded: String {
        let encodedData: Data? = self.string.data(using: String.Encoding.utf8)
        let base64String: String? = encodedData?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        return base64String!
    }

    /**
     Returns the string as a base64 decoded string if it was base64 encoded
    */
    var base64Decoded: String? {
        let base64Regex = "^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{4}|[A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)$"
        let range = self.string.range(of: base64Regex, options: NSString.CompareOptions.regularExpression)
        if range != nil {
            let decodedData: Data = Data(base64Encoded: self.string, options: NSData.Base64DecodingOptions(rawValue: 0))!
            let decodedString: String? = NSString(data: decodedData, encoding: String.Encoding.utf8.rawValue) as String?
            return decodedString
        } else {
            return nil
        }
    }

    /**
     Returns the string's ASCII value
    */
    var asciiValue: String {
        let regexPattern: String = "(0x)?([0-9a-f]{2})"
        let regex = try! NSRegularExpression( //swiftlint:disable:this force_try
            pattern: regexPattern,
            options: NSRegularExpression.Options.caseInsensitive
        )
        let nsString = self.string as NSString
        let matches = regex.matches(in: self.string, options: [], range: NSRange(location: 0, length: nsString.length))
        let characters = matches.map {
            Character(UnicodeScalar(UInt32(nsString.substring(with: $0.rangeAt(2)), radix: 16)!)!)
        }

        return String(characters)
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
    var hexValue: String {
        return self.string.data(using: String.Encoding.utf8)!.map { String(format: "%02hhx", $0) }.joined()
    }

}

public extension String {

    /**
     RapidDoubleDSL instance to access custom methods
    */
    var rpd: RapidStringDSL {
        return RapidStringDSL(string: self)
    }
}
