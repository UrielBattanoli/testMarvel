//
//  ConnectionManager.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit
import SwiftHTTP
import Gloss
import Arcane

class ConnectionManager: NSObject {
    static let sharedInstance = ConnectionManager()
    
    let URL = "http://gateway.marvel.com/v1/public/"
    let PUBLIC_KEY = "0e01853d666313fe49957777bb18784f"
    let PRIVAT_KEY = "49435692c0f6e2e581a4c9d51b182b5293d23df0"
    
    private func requestWithGetMethod(path: String, callback: @escaping (JSON?, Error?) -> ()) {
        do {
            let hash = Hash.MD5("\(1)\(self.PRIVAT_KEY)\(self.PUBLIC_KEY)")
            let params = ["ts" : "1", "apikey" : self.PUBLIC_KEY, "hash" : hash]
            let http = try HTTP.GET(self.URL+path, parameters: params)
            http.start({ (response) in
                callback(self.convertDataToJson(response.data), response.error)
            })
        }
        catch let error {
            print(error)
            callback(nil, error)
        }
    }
    
    private func convertDataToJson(_ data: Data) -> JSON? {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? JSON
            return json
        } catch {
            print("Something went wrong converting to dictionary")
        }
        
        return nil
    }
    
    func getCharacterList(_ callback: @escaping ([Character])->()) {
        self.requestWithGetMethod(path: "characters") { (jsons, error) in
            if let array = (jsons!["data"] as? [String : AnyObject])!["results"] as? [[String : AnyObject]] {
                var characters:[Character] = []
                for json in array {
                    characters.append(Character(json))
                }
                callback(characters)
            }
        }
    }
    
    func getComicListFromCharacter(_ characterId: Int, _ callback: @escaping ([Comic])->()) {
        self.requestWithGetMethod(path: "characters/\(characterId)/comics") { (jsons, error) in
            if let array = (jsons!["data"] as? [String : AnyObject])!["results"] as? [[String : AnyObject]] {
                var comics:[Comic] = []
                for json in array {
                    comics.append(Comic(json))
                }
                callback(comics)
            }
        }
    }
}
