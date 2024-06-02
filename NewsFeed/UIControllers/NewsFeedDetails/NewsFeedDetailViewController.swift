//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import UIKit
import SDWebImage

protocol NewsFeedDetailProtocol{
    func setData(data:Result?)
}

class NewsFeedDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var abstractTextView: UITextView!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgViewActivityInd: UIActivityIndicatorView!
    @IBOutlet weak var mediaHeightConstraint: NSLayoutConstraint!
    
    internal var data:Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViewController()
    }
    
    private func setUpViewController(){
        guard let data = data else{ self.navigationController?.popViewController(animated: false)
            return
        }
        if let title = data.title , !title.isEmpty {
            titleLabel.text = title
        }
        if let abstract = data.abstract  , !abstract.isEmpty {
            abstractTextView.text = abstract
        }
        if let pubDate = data.publishedDate  , !pubDate.isEmpty {
            publishedDateLabel.text = pubDate
        }
        if let imgUrl = data.media.first?.mediaMetadata.first?.url ,!imgUrl.isEmpty, NetworkUtils.isConnectedToInternet(){
            imgView.loadImage(imageUrl: imgUrl, activiyIndicator: imgViewActivityInd)
        }else{
            mediaHeightConstraint.constant = 0
        }
    }
    
}
//MARK: - NewsFeedDetailProtocol
extension NewsFeedDetailViewController: NewsFeedDetailProtocol{
    func setData(data: Result?) {
        guard let data = data else{return}
        self.data = data
    }
    
    
}

