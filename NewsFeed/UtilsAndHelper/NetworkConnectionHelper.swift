//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import UIKit
import Alamofire
import Reachability
class NetworkUtils {
    
    
    // Check if the device is connected to the internet
    class func isConnectedToInternet() -> Bool {
        if (NetworkReachabilityManager()?.isReachable ?? false) {
            return true
        }
        return false
        }
    
    
    // Show alert for no internet connection
    static var currentAlert: UIAlertController?
    
    class func showNoInternetAlert(viewController: UIViewController, retryAction: @escaping () -> Void) {
        // Check if an alert is already being presented
        if let currentAlert = NetworkUtils.currentAlert, viewController.presentedViewController == currentAlert {
            return
        }
        
        let alert = UIAlertController(title: "No Internet Connection", message: "Please check your internet connection and try again.", preferredStyle: .alert)
        
        // Settings action
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: { success in
                    if success && isConnectedToInternet() {
                        retryAction()
                    } else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            showNoInternetAlert(viewController: viewController, retryAction: retryAction)
                        }
                    }
                })
            }
        }
        alert.addAction(settingsAction)
        
        // Retry action
        let retryAlertAction = UIAlertAction(title: "Retry", style: .default) { _ in
            if isConnectedToInternet() {
                retryAction()
            } else {
                showNoInternetAlert(viewController: viewController, retryAction: retryAction)
            }
        }
        alert.addAction(retryAlertAction)
        
        // Store reference to the current alert
        NetworkUtils.currentAlert = alert
        
        // Present the alert
        DispatchQueue.main.async {
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    
    // Dismiss the current alert if it is being presented
    class func dismissCurrentAlert(viewController: UIViewController) {
        if let currentAlert = NetworkUtils.currentAlert, viewController.presentedViewController == currentAlert {
            currentAlert.dismiss(animated: true, completion: {
                NetworkUtils.currentAlert = nil // Clear the reference after dismissing
            })
        }
    }
}
