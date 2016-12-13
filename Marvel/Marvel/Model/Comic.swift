//
//  Comic.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class Comic: NSObject {

    var id: Int?
    var digitalId: Int?
    var title: String?
    var issueNumber: Double?
    var variantDescription: String?
    var descript: String?
    var modified: Date?
    var isbn: String?
    var upc: String?
    var diamondCode: String?
    var ean: String?
    var issn: String?
    var format: String?
    var pageCount: Int?
    var resourceUrl: String?
    var urls: [String] = []
    var series: [Serie] = []
    var dates: [Date] = []
    var prices: [Double] = []
    var thumbnail: String?
    var images: [String] = []
    var creators: [Creator] = []
    var characters: [Character] = []
    var stories: [Storie] = []
    var events: [Event] = []
    
    init(_ data: [String : AnyObject]) {
        if let dates = data["dates"] as? [[String : AnyObject]] {
            for date in dates {
                if let dt = DateFormatter().stringToDate(date["date"] as! String) {
                    self.dates.append(dt)
                }
            }
        }
        if let prices = data["prices"] as? [[String : AnyObject]] {
            for price in prices {
                if let prc = price["price"] as? Float {
                    self.prices.append(Double(prc))
                }
            }
        }
        
        if let image = data["thumbnail"]!["path"] as? String, let extens = data["thumbnail"]!["extension"] as? String {
            self.thumbnail = "\(image).\(extens)"
        }
        
        if let images = data["images"] as? [[String : AnyObject]] {
            for image in images {
                if let path = image["path"] as? String, let extens = image["extension"] as? String {
                    self.images.append("\(path).\(extens)")
                }
            }
        }
        
        if let id = data["id"] as? Int {
            self.id = id
        }
        
        if let digitalId = data["digitalId"] as? Int {
            self.digitalId = digitalId
        }
        
        if let title = data["title"] as? String {
            self.title = title
        }
        
        if let issueNumber = data["issueNumber"] as? Double {
            self.issueNumber = issueNumber
        }
        
        if let variantDescription = data["variantDescription"] as? String {
            self.variantDescription = variantDescription
        }
        
        if let descript = data["description"] as? String {
            self.descript = descript
        }
        
        if let modified = data["modified"] as? String {
            self.modified = DateFormatter().stringToDate(modified)
        }
        
        if let isbn = data["isbn"] as? String {
            self.isbn = isbn
        }
        
        if let upc = data["upc"] as? String {
            self.upc = upc
        }
        
        if let diamondCode = data["diamondCode"] as? String {
            self.diamondCode = diamondCode
        }
        
        if let ean = data["ean"] as? String {
            self.ean = ean
        }
        
        if let issn = data["issn"] as? String {
            self.issn = issn
        }
        
        if let format = data["format"] as? String {
            self.format = format
        }
        
        if let pageCount = data["pageCount"] as? Int {
            self.pageCount = pageCount
        }
        
        if let resourceUrl = data["resourceUrl"] as? String {
            self.resourceUrl = resourceUrl
        }
        
        if let urls = data["urls"] as? [[String : AnyObject]] {
            for url in urls {
                self.urls.append(url["url"] as! String)
            }
        }
        
    }
}
