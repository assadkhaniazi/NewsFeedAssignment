
import Foundation
import RealmSwift

// MARK: - Response
class Response: Codable {
    let status, copyright: String?
    let numResults:Int?
    let results: [Result]?
    var failedError:String?
    var failedStatus = false
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
    
    init(failedError:String,failedStatus:Bool){
        self.failedError = failedError
        self.failedStatus = failedStatus
         self.status = nil
         self.copyright = nil
         self.numResults = nil
         self.results = nil
    }
}


