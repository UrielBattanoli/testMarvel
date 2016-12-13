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
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    
    // OpenCell
    @IBOutlet weak var characterDescription: UILabel!
    @IBOutlet weak var comicsButton: UIButton!
    @IBOutlet weak var storiesButton: UIButton!
    @IBOutlet weak var eventsButton: UIButton!
    @IBOutlet weak var seriesButton: UIButton!
    
    //MARK: - Variables
    var character: Character! {
        didSet {
            if let pathImage = self.character.thumbnail, self.characterImageView != nil{
                self.characterImageView.loadImage(pathImage)
            }
            if let name = self.character.name, self.characterName != nil {
                self.characterName.text = name
            }
            if let description = self.character.descript, self.characterDescription != nil {
                self.characterDescription.text = description
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
