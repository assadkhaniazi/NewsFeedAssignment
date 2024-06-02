//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import Foundation
import RealmSwift

class RealmManager {
    
    /// don't allow main thread queries.
    
    var realm = try? Realm()
    
    init() {
        do{
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask,
                                                                appropriateFor: nil, create: false)
            let url = documentDirectory.appendingPathComponent(ProjectConstants.current.getDatabaseName())
            let config = Realm.Configuration(fileURL: url,schemaVersion: 1,deleteRealmIfMigrationNeeded: true)
            self.realm = try Realm(configuration: config)
        }catch{
            print(StringConstant.FailedDatabaseMessage + "\(error)")
        }
    }
    
    func insertNewsFeedIntoDb(results: [Result]?)->Bool{
        guard let newsFeedArray = results else { return  false}
        
        do {
            try realm?.write {
                realm?.deleteAll()//Clearing old db inserting new news feed into db
                realm?.add(newsFeedArray,update: .all)
            }
            return true
        }
        catch let error as NSError{
            print(error.localizedDescription," cannot add NewsFeed to db")
            return false
        }
    }
    
    func getNewsFeedFromDb()->[Result]?{
        let data = realm?.objects(Result.self)
        if data?.count ?? 0 > 0 {
            if let DetachedData = data?.detached{
                return DetachedData
            }
        }
        return [Result]()
    }
    
}
