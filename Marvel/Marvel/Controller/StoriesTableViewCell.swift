//
//  StoriesTableViewCell.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class StoriesTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var storieTitleLbl: UILabel!
    @IBOutlet weak var storieDescriptionLbl: UILabel!
    
    // MARK: - Variables
    var storie: Storie? {
        didSet {
            if let title = self.storie?.title {
                self.storieTitleLbl.text = title
            }
            if let descript = self.storie?.descript {
                self.storieDescriptionLbl.text = descript
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
