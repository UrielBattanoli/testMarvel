//
//  ComicListViewController.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class ComicListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: - Variables
    var character: Character!
    var comics: [Comic] = [] {
        didSet {
            self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        }
    }
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.character.comics.count == 0 {
            self.loadComics()
        }
        else {
            self.comics = self.character.comics
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Functions
    func loadComics() {
        self.loader.startAnimating()
        ConnectionManager.sharedInstance.getComicListFromCharacter(self.character.id!) { (comics) in
            DispatchQueue.main.async {
                self.comics = comics
                self.character.comics = comics
                self.loader.stopAnimating()
            }
        }
    }
    
    // MARK: - TableView data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.comics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comicCell") as! ComicTableViewCell
        cell.comic = self.comics[indexPath.row]
        
        return cell
    }
    
    // MARK: - TableView delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
