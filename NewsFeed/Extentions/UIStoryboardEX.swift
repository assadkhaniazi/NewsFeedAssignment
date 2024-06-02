//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import Foundation
import UIKit

extension UIStoryboard{
    private static var Main : UIStoryboard{
        return UIStoryboard.init(name: "Main", bundle: nil)
    }
    static var NewsFeedDetailVC:NewsFeedDetailViewController{
        return (Main.instantiateViewController(withIdentifier: "NewsFeedDetailViewController") as! NewsFeedDetailViewController)
    }
}
