

import Foundation

// MARK: - ResponseGeneral
struct ErrorModel: Codable {

    let fault: ErrorRespose?
    let progress: Double?
    
     enum CodingKeys : String, CodingKey {
        case fault
        case progress

    }
}

// MARK: - Fault
struct ErrorRespose: Codable {
    let faultstring: String?
    let detail: Detail?
}

// MARK: - Detail
struct Detail: Codable {
    let errorcode: String?
}
