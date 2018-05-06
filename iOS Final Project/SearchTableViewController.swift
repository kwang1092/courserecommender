//
//  ViewController.swift
//  rl597_p6
//
//  Created by Robert Li on 4/20/18.
//  Copyright © 2018 Robert Li. All rights reserved.
//

import UIKit
import AVFoundation

class SearchViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate  {
    var searchController: UISearchController!
    var timer: Timer?
    
    let recipeCellIdentifier = "RecipeCell"
    
    var recipes: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Class Finder"
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by class"
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
        
    }
    
    // MARK: UITableView Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: recipeCellIdentifier) ??
            UITableViewCell(style: .subtitle, reuseIdentifier: recipeCellIdentifier)
        
        let recipe = recipes[indexPath.row]
        cell.textLabel?.text = recipe.name
        cell.detailTextLabel?.text = recipe.ingredients
        cell.detailTextLabel?.alpha = 0.5
        return cell
        
    }
    
    // MARK: UITableView Delegate
    // Might change this later
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = recipes[indexPath.row]
        if let preview = recipe.previewLink {
            UIApplication.shared.open(preview)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARk: UISearchBar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(getRecipes(_:)), userInfo: ["searchText": searchText], repeats: false)
    }
    
    // MARK: UISearchResults Delegate
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text {
            if !searchText.isEmpty {
                //                Network.getTracks(withQuery: searchText) { (songs) in
                //                    self.songs = songs
                //                    self.tableView.reloadData()
                //                }
            }
        }
        
    }
    
    // MARK: Network
    
    @objc func getRecipes(_ timer: Timer) {
        
        guard
            let userInfo = timer.userInfo as? [String : String],
            let searchText = userInfo["searchText"]
            else {
                return
        }
        
        Network.getRecipes(withQuery: searchText) { (recipes) in
            self.recipes = recipes
            self.tableView.reloadData()
        }
        
    }
    
}



