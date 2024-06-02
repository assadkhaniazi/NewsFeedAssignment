//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import UIKit

class BaseViewController: UIViewController {
    private var activityIndicatorView : ActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNibView()
    }
    
    private func setupNibView(){
        /// Activity Indicator View
        self.activityIndicatorView = UINib(nibName: UINibConstant.ActivityIndicatorNib, bundle: .main).instantiate(withOwner: nil, options: nil).first as? ActivityIndicatorView
        self.activityIndicatorView.frame = self.view.frame
        
    }
    internal func showActivityIndicator(){
        self.view.addSubview(activityIndicatorView)
    }
    internal func removeActivityIndicator(){
        self.activityIndicatorView.removeFromSuperview()
    }

}
