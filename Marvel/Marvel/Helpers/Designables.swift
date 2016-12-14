//
//  Designables.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

@IBDesignable class BTNAttributedStyle: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        
    }
}
