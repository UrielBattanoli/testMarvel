//
//  SerieListViewController.swift
//  Marvel
//
//  Created by Uriel Battanoli on 14/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class SerieListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: - Variables
    var character: Character!
    var serieList: [Serie] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
        
        if self.character.series.count == 0 {
            self.loadSeries()
        }
        else {
            self.serieList = self.character.series
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Functions
    func loadSeries() {
        self.loader.startAnimating()
        ConnectionManager.sharedInstance.getSerieListFromCharacter(self.character.id!) { (series) in
            DispatchQueue.main.sync {
                self.character.series = series
                self.serieList = series
                self.loader.stopAnimating()
            }
        }
    }
    
    func didPressInfoButton(sender: AnyObject) {
        guard let button = sender as? UIButton else {
            return
        }
        let serie = self.serieList[button.tag]
        
        UIApplication.shared.open(URL(string: serie.urls[0])!, options: [:], completionHandler: nil)
    }
    
    
    // MARK: - TableView data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.serieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serieCell") as! SerieTableViewCell
        
        let serie = self.serieList[indexPath.row]
        cell.serie = serie
        
        if serie.urls.count == 0 {
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
