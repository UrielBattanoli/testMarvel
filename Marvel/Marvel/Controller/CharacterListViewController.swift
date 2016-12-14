//
//  CharacterListViewController.swift
//  Marvel
//
//  Created by Uriel Battanoli on 13/12/16.
//  Copyright © 2016 Uriel. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: - Variables
    var characterList: [Character] = []{
        didSet {
            self.tableView.reloadData()
        }
    }
    var selectedCharacter = -1
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        self.loadCharacters()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Functions
    func loadCharacters() {
        self.loader.startAnimating()
        ConnectionManager.sharedInstance.getCharacterList { (characters) in
            DispatchQueue.main.async {
                self.characterList = characters
                self.loader.stopAnimating()
            }
        }
    }
    
    // MARK: - TableView data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.characterList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedCharacter == section ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CharacterTableViewCell!
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "characterCell") as! CharacterTableViewCell
            cell.separatorView.isHidden = indexPath.section == 0 ? true : false
        }
        else{
            cell = tableView.dequeueReusableCell(withIdentifier: "openCharacterCell") as! CharacterTableViewCell
        }
        cell.character = self.characterList[indexPath.section]
        return cell
    }
    
    // MARK: - TableView delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row == 0 {
            let indexSet: IndexSet = self.selectedCharacter == -1 ? IndexSet(integer: indexPath.section) : IndexSet(arrayLiteral: self.selectedCharacter, indexPath.section)
            
            self.selectedCharacter = self.selectedCharacter == indexPath.section ? -1 : indexPath.section
            
            tableView.reloadSections(indexSet, with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 194
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let character = self.characterList[self.selectedCharacter]
        switch segue.identifier! {
        case "goToCharacterComics":
            let vcComic = segue.destination as! ComicListViewController
            vcComic.character = character
//        case "goToCharacterEvents":
//            
//        case "goToCharacterSeries":
//            
        case "goToCharacterStories":
            let vcStorie = segue.destination as! StoriesViewController
            vcStorie.character = character
        default:
            break
        }
    }
}
