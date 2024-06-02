//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import Foundation
import RxSwift
import Alamofire
//MARK:- API
protocol DataManagerProtocol{
    func getNewsFeed<U:Codable>(getNewsFeed:GetNewsFeed,erreModel:U.Type) ->Observable<Response>
    
    //MARK:- Database
    func insertNewsFeedIntoDb(results: [Result]?)->Bool
    func getNewsFeedFromDb()->[Result]?
}
