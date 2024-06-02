//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import Foundation
import Realm
import RealmSwift


class RealmHelper {
    //Used to expose generic
    static func DetachedCopy<T:Codable>(of object:T) -> T?{
       do{
           let json = try JSONEncoder().encode(object)
           return try JSONDecoder().decode(T.self, from: json)
       }
       catch let error{
           print(error)
           return nil
       }
    }
}
//MARK: - Realm Extension Protocol
protocol RealmListDetachable {
func detached() -> Self
}
//MARK: - Detach Object Extention
extension List: RealmListDetachable where Element: Object {
    func detached() -> List<Element> {
        let detached = self.detached
        let result = List<Element>()
        result.append(objectsIn: detached)
        return result
    }

}

//MARK: - Detach Object-c Extention
@objc extension Object {
    public func detached() -> Self {
        let detached = type(of: self).init()
        for property in objectSchema.properties {
            guard let value = value(forKey: property.name) else { continue }
            if let detachable = value as? Object {
                detached.setValue(detachable.detached(), forKey: property.name)
            } else if let list = value as? RealmListDetachable {
                detached.setValue(list.detached(), forKey: property.name)
            } else {
                detached.setValue(value, forKey: property.name)
            }
        }
        return detached
    }
}

//MARK: - Detach ListExtention
extension Sequence where Iterator.Element: Object {

    public var detached: [Element] {
        return self.map({ $0.detached() })
    }

}


//MARK: - Convert Realm Result list ot array
extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }

        return array
    }
}
