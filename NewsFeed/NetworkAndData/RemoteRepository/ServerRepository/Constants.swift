//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import Foundation
struct Constants {
    
    //The API's base URL
    
    static let baseUrl = ProjectConstants.current.getBaseURL()
    
    //The parameters (Queries) that we're gonna use
    struct Parameters {
        
     static let apiKey = "api-key"
      
    }
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
        case multipart = "multipart/form-data"
    }
}
