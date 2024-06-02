//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import Foundation

class UserDefaultUtils {
    private static func getUserDefault()->UserDefaults{
        return UserDefaults.standard
        
    }
    
    public static func isValueNil(key:String) ->Any?{
       return getUserDefault().object(forKey: key)
    }
    public static func setInteger(value:Int,key:String){
        getUserDefault().set(value, forKey: key)
        getUserDefault().synchronize()
    }
    
    public static func getInteger(key:String) -> Int{
        return getUserDefault().integer(forKey: key)
    }
    
    public static func setDouble(value:Double,key:String){
        getUserDefault().set(value, forKey: key)
        getUserDefault().synchronize()
    }
    
    public static func getDouble(key:String) -> Double{
        return getUserDefault().double(forKey: key)
    }
    
    public static func setString(value:String,key:String){
        getUserDefault().set(value, forKey: key)
        getUserDefault().synchronize()
    }
    
    public static func getString(key:String) -> String{
        return getUserDefault().string(forKey: key) ?? ""
        
    }
    
    public static func setBool(value:Bool,key:String){
        getUserDefault().set(value, forKey: key)
        getUserDefault().synchronize()
    }
    
    public static func getBool(key:String) -> Bool?{
        return getUserDefault().bool(forKey: key)
    }
    
    //MARK: - Get Object from UserDefault
     public static func object<T: Codable>(_ type: T.Type, with key: String, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
             guard let data = getUserDefault().value(forKey: key) as? Data else { return nil }
             return try? decoder.decode(type.self, from: data)
         }
     
    //MARK: - Set Object in UserDefault
      public static func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
             let data = try? encoder.encode(object)
             getUserDefault().set(data, forKey: key)
         }
    
}
