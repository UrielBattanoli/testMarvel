//
//  EventTableViewCell.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var infoBt: BTNAttributedStyle!
    
    // MARK: - Variables
    var event: Event? {
        didSet {
            if let path = self.event?.thumbnail {
                self.eventImageView.loadImage(path)
            }
            if let description = self.event?.descript {
                self.eventDescription.text = description
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
