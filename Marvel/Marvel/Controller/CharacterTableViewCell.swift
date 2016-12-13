//
//  CharacterTableViewCell.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    
    //MARK: - Variables
    var character: Character! {
        didSet {
            if let pathImage = self.character.thumbnail{
                self.characterImageView.loadImage(pathImage)
            }
            self.characterName.text = self.character.name
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
