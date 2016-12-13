//
//  ComicTableViewCell.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class ComicTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var comicTitle: UILabel!
    @IBOutlet weak var comicImageView: UIImageView!
    
    // MARK: - Variables
    var comic: Comic? {
        didSet {
            if let title = self.comic?.title{
                self.comicTitle.text = title
            }
            if let path = self.comic?.thumbnail {
                self.comicImageView.loadImage(path)
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
