//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import Foundation
import RxSwift
import Alamofire

class Apiclient:BaseApiClient {

    static func getNewsFeedApi<U:Codable>(getNewsFeed:GetNewsFeed,errorType: U.Type) -> Observable<Response> {
        return request(urlConvertible: ApiRouter.getNewsFeed(getNewsFeed: getNewsFeed), errorType: U.self)
    }
    
}


