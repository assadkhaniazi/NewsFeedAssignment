//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import Foundation
import Alamofire


enum ApiRouter: URLRequestConvertible {
    
    
    case getNewsFeed(getNewsFeed:GetNewsFeed)
    
    //MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl?.asURL()
        var urlRequest = URLRequest(url: (url?.appendingPathComponent(path))!)
        
        //Http method
        urlRequest.httpMethod = method.rawValue
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            case .post:
                return JSONEncoding.default
            case .delete:
                return URLEncoding.default
            case .patch:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    //MARK: - HttpMethod
    //This returns the HttpMethod type. It's used to determine the type if several endpoints are peresent
    private var method: HTTPMethod {
        switch self {
        case .getNewsFeed:
            return .get
            
            
        }
    }
    
    //MARK: - Path
    //The path is the part following the base url
    private var path: String {
        switch self {
        case .getNewsFeed(let getNewsFeed):
            return URLModifier.ModifiedGetNewsFeedUrl(getNewsFeed: getNewsFeed)
        }
    }
    
    //MARK: - Parameters
    //This is the queries part, it's optional because an endpoint can be without parameters
    private var parameters: Parameters? {
        switch self {
        case .getNewsFeed( let newsFeed):
            //A dictionary of the key (From the constants file) and its value is returned
            return [Constants.Parameters.apiKey:newsFeed.apiKey]
            
            
        }
        
        
    }
}


