//
//  BoxOfficeTableViewCell.swift
//  SeSAC_Week03
//
//  Created by ChanhoHwang on 2021/10/13.
//

import UIKit

class BoxOfficeTableViewCell: UITableViewCell {

    @IBOutlet weak var poseterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
