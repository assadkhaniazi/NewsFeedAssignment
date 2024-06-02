//  Technology Assessment
//  Created by assad Khan niazi on 02/06/2024.


import UIKit


class NewsFeedCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var backgroundContainer: UIView!
   
    override func prepareForReuse() {
        backgroundContainer.backgroundColor = UIColor.white
        titleLabel.text = ""
        byLineLabel.text = ""
        dateLabel.text = ""
    }
    
    internal func setUpCellForNewsFeed(result:Result?, indexRow:Int){
        backgroundContainer.backgroundColor = (indexRow % 2 == 0) ? UIColor.white : UIColor.lightGray
        guard let data = result else{return}
        titleLabel.text = data.title
        if let byline = data.byline, !byline.isEmpty {
            byLineLabel.text = byline
        } else {
            byLineLabel.text = StringConstant.ByNewYorkTimes
        }
        dateLabel.text = data.publishedDate
    }
}
