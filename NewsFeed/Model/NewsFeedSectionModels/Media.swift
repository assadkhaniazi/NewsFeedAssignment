
import Foundation
import RealmSwift


// MARK: - Media
class Media: Object, Codable {
    @objc dynamic var type: String? = nil
    @objc dynamic var subtype: String? = nil
    @objc dynamic var caption: String? = nil
    @objc dynamic var copyright: String? = nil
    @objc dynamic var approvedForSyndication = -1
    let mediaMetadata = List<MediaMetadatum>()

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }

    // Required initializer for Codable conformance
    required override init() {
        super.init()
    }

    // Initializer to create from decoder
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        subtype = try container.decodeIfPresent(String.self, forKey: .subtype)
        caption = try container.decodeIfPresent(String.self, forKey: .caption)
        copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        approvedForSyndication = try container.decodeIfPresent(Int.self, forKey: .approvedForSyndication) ?? -1
        
        let mediaMetadataArray = try container.decodeIfPresent([MediaMetadatum].self, forKey: .mediaMetadata) ?? []
        mediaMetadata.append(objectsIn: mediaMetadataArray)
        
        super.init()
    }

    // Encoding function for Codable conformance
     func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(subtype, forKey: .subtype)
        try container.encode(caption, forKey: .caption)
        try container.encode(copyright, forKey: .copyright)
        try container.encode(approvedForSyndication, forKey: .approvedForSyndication)
        try container.encode(Array(mediaMetadata), forKey: .mediaMetadata)
    }
}

