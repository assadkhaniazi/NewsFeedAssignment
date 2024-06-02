//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import Foundation
import UIKit

class Utils {
  
    static public func showAlert(vc : UIViewController,title:String,message:String,titleYesButton:String,onYesPress yes: @escaping () -> Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: titleYesButton, style: .default) { (action) in
            yes()
        }

        alert.addAction(yesAction)

        vc.present(alert, animated: true)
    }
    
    static public func showAlert(vc:UIViewController,message:String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        vc.present(alert, animated: true)
    }
    
}

