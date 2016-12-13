//
//  DateExtension.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

extension DateFormatter {
    func stringToDate(_ string: String)-> Date? {
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let index = string.index(string.startIndex, offsetBy: 19)
        return self.date(from: string.substring(to: index)) ?? nil
    }
}
