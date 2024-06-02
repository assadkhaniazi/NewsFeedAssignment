//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import Foundation

public class BuilderForGetNewsFeed {
    var section: String = ""
    var apiKey: String = ""

    public init() {}

    public func setSection(_ section: String) {
        self.section = section
    }

    public func setApikey(_ apiKey: String) {
        self.apiKey = apiKey
    }

  
    public func getSection() -> String {
        return section
    }


    public func getApiKey() -> String {
        return apiKey
    }
    public func build() -> GetNewsFeed {
        return GetNewsFeed(section:section , apiKey: apiKey)
    }
    
    
}



