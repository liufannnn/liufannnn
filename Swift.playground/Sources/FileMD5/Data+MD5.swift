import Foundation
import CryptoKit

extension Data {
    
    public var md5: String {
        Insecure
            .MD5
            .hash(data: self)
            .map { String(format: "%02x", $0) }
            .joined()
    }
}
