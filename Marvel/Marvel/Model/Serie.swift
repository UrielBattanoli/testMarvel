//
//  Serie.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class Serie: NSObject {

    var id: Int?
    var title: String?
    var descript: String?
    var resourceUrl: String?
    var urls: [String] = []
    var startYear: Int?
    var endYear: Int?
    var rating: String?
    var modified: Date?
    var thumbnail: String?
    var comics: [Comic] = []
    var stories: [Storie] = []
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
        
        if let urls = data["urls"] as? [[String : AnyObject]] {
            for url in urls {
                self.urls.append(url["url"] as! String)
            }
        }
        
        if let startYear = data["startYear"] as? Int {
            self.startYear = startYear
        }
        
        if let endYear = data["endYear"] as? Int {
            self.endYear = endYear
        }
        
        if let rating = data["rating"] as? String {
            self.rating = rating
        }
        
        if let modified = data["modified"] as? Date {
            self.modified = modified
        }
        
        if let image = data["thumbnail"]!["path"] as? String, let extens = data["thumbnail"]!["extension"] as? String {
            self.thumbnail = "\(image).\(extens)"
        }
    }
}
