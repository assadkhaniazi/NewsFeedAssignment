//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import UIKit
import Foundation
import SDWebImage

private let imageOptions : SDWebImageOptions = SDWebImageOptions(rawValue: SDWebImageOptions.retryFailed.rawValue | SDWebImageOptions.progressiveLoad.rawValue | SDWebImageOptions.continueInBackground.rawValue |
       SDWebImageOptions.allowInvalidSSLCertificates.rawValue)

extension UIImageView {
    
    func loadImage(imageUrl:String,activiyIndicator: UIActivityIndicatorView)  {
        activiyIndicator.isHidden = false
        activiyIndicator.startAnimating()
        self.sd_setImage(with: URL(string : imageUrl), placeholderImage: UIImage(), options: imageOptions) { (image, error, type, url) in
            if error != nil {
                activiyIndicator.isHidden = true
                activiyIndicator.stopAnimating()
                return
            }
            activiyIndicator.isHidden = true
            activiyIndicator.stopAnimating()
        }
    }
}
