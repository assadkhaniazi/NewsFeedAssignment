import UIKit
import RxSwift
import Alamofire
//MARK: - API DataBase Protocols Implementation
//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


class DataManager:NSObject,DataManagerProtocol{
    func getNewsFeed<U:Codable>(getNewsFeed:GetNewsFeed, erreModel:U.Type) ->Observable<Response> {
        return Apiclient.getNewsFeedApi(getNewsFeed: getNewsFeed,errorType: U.self).observeOn(MainScheduler.instance)
    }
}
//MARK: - DataBase Protocols Implementation
extension DataManager{
    
    func insertNewsFeedIntoDb(results: [Result]?)->Bool{
       return getRealmInstance().insertNewsFeedIntoDb(results: results)
    }
    
    func getNewsFeedFromDb()->[Result]?{
        return getRealmInstance().getNewsFeedFromDb()
    }
    
    private func getRealmInstance() -> RealmManager{
        return RealmManager()
    }
}

