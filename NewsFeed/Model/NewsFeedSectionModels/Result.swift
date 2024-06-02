import Foundation
import RealmSwift

// MARK: - Result
class Result: Object, Codable {
    @objc dynamic var uri: String? = nil
    @objc dynamic var url: String? = nil
    @objc dynamic var id = -1
    @objc dynamic var assetID = -1
    @objc dynamic var source: String? = nil
    @objc dynamic var publishedDate: String? = nil
    @objc dynamic var updated: String? = nil
    @objc dynamic var section: String? = nil
    @objc dynamic var subsection: String? = nil
    @objc dynamic var nytdsection: String? = nil
    @objc dynamic var adxKeywords: String? = nil
    @objc dynamic var byline: String? = nil
    @objc dynamic var type: String? = nil
    @objc dynamic var title: String? = nil
    @objc dynamic var abstract: String? = nil
    let media = List<Media>()
    @objc dynamic var etaID = -1

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case byline, type, title, abstract
        case media
        case etaID = "eta_id"
    }

    // Required initializer for Codable conformance
    required override init() {
        super.init()
    }
    override static func primaryKey() -> String? {
            return "id"
        }
    // Initializer to create from decoder
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uri = try container.decodeIfPresent(String.self, forKey: .uri)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? -1
        assetID = try container.decodeIfPresent(Int.self, forKey: .assetID) ?? -1
        source = try container.decodeIfPresent(String.self, forKey: .source)
        publishedDate = try container.decodeIfPresent(String.self, forKey: .publishedDate)
        updated = try container.decodeIfPresent(String.self, forKey: .updated)
        section = try container.decodeIfPresent(String.self, forKey: .section)
        subsection = try container.decodeIfPresent(String.self, forKey: .subsection)
        nytdsection = try container.decodeIfPresent(String.self, forKey: .nytdsection)
        adxKeywords = try container.decodeIfPresent(String.self, forKey: .adxKeywords)
        byline = try container.decodeIfPresent(String.self, forKey: .byline)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        abstract = try container.decodeIfPresent(String.self, forKey: .abstract)
        etaID = try container.decodeIfPresent(Int.self, forKey: .etaID) ?? -1

        if let mediaArray = try container.decodeIfPresent([Media].self, forKey: .media) {
            media.append(objectsIn: mediaArray)
        }
        
        super.init()
    }

    // Encoding function for Codable conformance
     func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uri, forKey: .uri)
        try container.encode(url, forKey: .url)
        try container.encode(id, forKey: .id)
        try container.encode(assetID, forKey: .assetID)
        try container.encode(source, forKey: .source)
        try container.encode(publishedDate, forKey: .publishedDate)
        try container.encode(updated, forKey: .updated)
        try container.encode(section, forKey: .section)
        try container.encode(subsection, forKey: .subsection)
        try container.encode(nytdsection, forKey: .nytdsection)
        try container.encode(adxKeywords, forKey: .adxKeywords)
        try container.encode(byline, forKey: .byline)
        try container.encode(type, forKey: .type)
        try container.encode(title, forKey: .title)
        try container.encode(abstract, forKey: .abstract)
        try container.encode(Array(media), forKey: .media)
        try container.encode(etaID, forKey: .etaID)
    }
}

