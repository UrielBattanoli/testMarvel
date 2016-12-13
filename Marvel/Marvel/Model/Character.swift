//
//  Character.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class Character: NSObject {

    var id: Int?
    var name: String?
    var descript: String?
    var modified: Date?
    var resourceUrl: String?
    var urls: [String] = []
    var thumbnail: String?
    var comics: [Comic] = []
    var stories: [Storie] = []
    var events: [Event] = []
    var series: [Serie] = []
    
    init(_ data: [String : AnyObject]) {
        if let id = data["id"] as? Int {
            self.id = id
        }
        
        if let name = data["name"] as? String {
            self.name = name
        }
        
        if let descript = data["description"] as? String {
            self.descript = descript
        }
        
        if let modified = data["modified"] as? Date {
            self.modified = modified
        }
        
        if let resourceUrl = data["resourceUrl"] as? String {
            self.resourceUrl = resourceUrl
        }
        
        if let urls = data["urls"] as? [[String : AnyObject]] {
            for url in urls {
                self.urls.append(url["url"] as! String)
            }
        }
        
        if let image = data["thumbnail"]!["path"] as? String, let extens = data["thumbnail"]!["extension"] as? String {
            self.thumbnail = "\(image).\(extens)"
        }
    }
}
