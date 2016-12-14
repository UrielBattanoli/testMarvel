//
//  SerieTableViewCell.swift
//  Marvel
//
//  Created by Uriel Battanoli on 14/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class SerieTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventYearLbl: UILabel!
    @IBOutlet weak var eventTitleLbl: UILabel!
    @IBOutlet weak var eventDescriptionLbl: UILabel!
    @IBOutlet weak var infoBt: BTNAttributedStyle!
    
    // MARK: - Variables
    var serie: Serie? {
        didSet {
            if let path = self.serie?.thumbnail {
                self.eventImageView.loadImage(path)
            }
            
            self.eventTitleLbl.text = self.serie?.title ?? ""
            
            self.eventDescriptionLbl.text = self.serie?.descript ?? ""
            
            if let startYear = self.serie?.startYear , let endYear = self.serie?.endYear {
                self.eventYearLbl.text = "\(startYear) - \(endYear)"
            }
            else {
                self.eventYearLbl.text = ""
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
