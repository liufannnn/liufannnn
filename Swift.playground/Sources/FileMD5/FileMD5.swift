import Foundation

public struct FileMD5 {
    var name: String
    var fileType: String
    
    public init(name: String, fileType: String) {
        self.name = name
        self.fileType = fileType
    }
    
    /// 获取文件MD5值
    public static func getMD5(with arr: [FileMD5]) -> [String] {
        var md5Array = [String]()
        for fileMd5 in arr {
            let path = Bundle.main.path(forResource: fileMd5.name, ofType: fileMd5.fileType)!
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            md5Array.append(data.md5)
        }
        return md5Array
    }
}
