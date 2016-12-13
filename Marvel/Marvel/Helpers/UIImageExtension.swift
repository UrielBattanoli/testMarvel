//
//  UIImageExtension.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(_ url: String) {
        let urlToKf = URL(string: url)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: urlToKf)
    }
}
