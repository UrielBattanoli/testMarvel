//
//  Creator.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class Creator: NSObject {

    var id: Int?
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var suffix: String?
    var fullName: String?
    var modified: Date?
    var resourceUrl: String?
    var urls: [String] = []
    var thumbnail: String?
    var series: [Serie] = []
    var stories: [Storie] = []
    var comics: [Comic] = []
    var events: [Event] = []
    
    init(_ data: [String : AnyObject]) {
        if let id = data["id"] as? Int {
            self.id = id
        }
        
        if let firstName = data["firstName"] as? String {
            self.firstName = firstName
        }
        
        if let middleName = data["middleName"] as? String {
            self.middleName = middleName
        }
        
        if let lastName = data["lastName"] as? String {
            self.lastName = lastName
        }
        
        if let suffix = data["suffix"] as? String {
            self.suffix = suffix
        }
        
        if let fullName = data["fullName"] as? String {
            self.fullName = fullName
        }
        
        if let modified = data["modified"] as? String {
            self.modified = DateFormatter().stringToDate(modified)
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
