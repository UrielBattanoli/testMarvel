//
//  StoriesViewController.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class StoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: - Variables
    var character: Character!
    var stories:[Storie] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.character.stories.count == 0 {
            self.loadStories()
        }
        else{
            self.stories = self.character.stories
        }
        
        self.tableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Functions
    func loadStories() {
        self.loader.startAnimating()
        ConnectionManager.sharedInstance.getStorieListFromCharacter(self.character.id!) { (stories) in
            DispatchQueue.main.async {
                self.stories = stories
                self.character.stories = stories
                self.loader.stopAnimating()
            }
        }
    }
    
    // MARK: - TableView data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storiesCell") as! StoriesTableViewCell
        cell.storie = self.stories[indexPath.row]
        return cell
    }
    
    // MARK: - TableView delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
