//
//  EventListViewController.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: - Variables
    var character: Character!
    var eventList: [Event] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.character.events.count == 0 {
            self.loadEvents()
        }
        else{
            self.eventList = self.character.events
        }
        
        self.tableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Functions
    func loadEvents() {
        self.loader.startAnimating()
        ConnectionManager.sharedInstance.getEventListFromCharacter(self.character.id!) { (events) in
            DispatchQueue.main.async {
                self.eventList = events
                self.character.events = events
                self.loader.stopAnimating()
            }
        }
    }
    
    func didPressInfoButton(sender: AnyObject) {
        guard let button = sender as? UIButton else {
            return
        }
        let event = self.eventList[button.tag]
        
        UIApplication.shared.open(URL(string: event.urls[0])!, options: [:], completionHandler: nil)
    }
    
    // MARK: - TableView data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventTableViewCell
        
        let event = self.eventList[indexPath.row]
        cell.event = event
        
        if event.urls.count == 0 {
            cell.infoBt.isHidden = true
        }
        else{
            cell.infoBt.isHidden = false
            cell.infoBt.tag = indexPath.row
            cell.infoBt.addTarget(self, action: #selector(EventListViewController.didPressInfoButton(sender:)), for: .touchUpInside)
        }
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
        return 300
    }
}
