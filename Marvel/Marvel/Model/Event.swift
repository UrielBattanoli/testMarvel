//
//  Event.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class Event: NSObject {

    var id: Int?
    var title: String?
    var descript: String?
    var resourceUrl: String?
    var urls: [String]?
    var modified: Date?
    var start: Date?
    var end: Date?
    var thumbnail: String?
    var comics: [Comic] = []
    var stories: [Storie] = []
    var series: [Serie] = []
    var characters: [Character] = []
    var creators: [Creator] = []
    
    init(_ data: [String : AnyObject]) {
        if let id = data["id"] as? Int {
            self.id = id
        }
        
        if let descript = data["description"] as? String {
            self.descript = descript
        }
        
        if let resourceUrl = data["resourceUrl"] as? String {
            self.resourceUrl = resourceUrl
        }
        
        if let urls = data["urls"] as? [String] {
            self.urls = urls
        }
        
        if let modified = data["modified"] as? Date {
            self.modified = modified
        }
        
        if let start = data["start"] as? Date {
            self.start = start
        }
        
        if let end = data["end"] as? Date {
            self.end = end
        }
        
        if let thumbnail = data["thumbnail"] as? String {
            self.thumbnail = thumbnail
        }
    }
}
