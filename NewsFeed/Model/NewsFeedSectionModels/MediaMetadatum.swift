import Foundation
import RealmSwift

// MARK: - MediaMetadatum
class MediaMetadatum: Object, Codable {
    @objc dynamic var url: String? = nil
    @objc dynamic var format: String? = nil
    @objc dynamic var height = 0
    @objc dynamic var width = 0
    
    enum CodingKeys: String, CodingKey {
        case url, format, height, width
    }

    // Required initializer for Codable conformance
    required override init() {
        super.init()
    }

    // Additional initializer for convenience
    init(url: String?, format: String?, height: Int, width: Int) {
        self.url = url
        self.format = format
        self.height = height
        self.width = width
    }

    // Encoding and decoding functions for Codable conformance
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        format = try container.decodeIfPresent(String.self, forKey: .format)
        height = try container.decodeIfPresent(Int.self, forKey: .height) ?? 0
        width = try container.decodeIfPresent(Int.self, forKey: .width) ?? 0
        super.init()
    }

     func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
        try container.encode(format, forKey: .format)
        try container.encode(height, forKey: .height)
        try container.encode(width, forKey: .width)
    }
}
