//
//  Storie.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class Storie: NSObject {

    var id: Int?
    var title: String?
    var descript: String?
    var resourceUrl: String?
    var type: String?
    var modified: Date?
    var thumbnail: String?
    var comics: [Comic] = []
    var series: [Serie] = []
    var events: [Event] = []
    var characters: [Character] = []
    var creators: [Creator] = []
    
    init(_ data: [String : AnyObject]) {
        if let id = data["id"] as? Int {
            self.id = id
        }
        
        if let title = data["title"] as? String {
            self.title = title
        }
        
        if let descript = data["description"] as? String {
            self.descript = descript
        }
        
        if let resourceUrl = data["resourceUrl"] as? String {
            self.resourceUrl = resourceUrl
        }
        
        if let type = data["type"] as? String {
            self.type = type
        }
        
        if let modified = data["modified"] as? Date {
            self.modified = modified
        }
        
        if let thumbnail = data["thumbnail"] as? String {
            self.thumbnail = thumbnail
        }
    }
}
