//
//  ViewController.swift
//  StoreSearch
//
//  Created by Tim Fosteman on 2020-01-18.
//  Copyright © 2020 Fosteman's Software Solutions LLC. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var searchResults = [SearchResult]()
    var searchPerformed = false
    
    struct TableView {
        struct CellIdentifiers {
            static let searchResultCell = "SearchResultCell"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        
        let cellNib = UINib(nibName: TableView.CellIdentifiers.searchResultCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableView.CellIdentifiers.searchResultCell)
    }


}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        searchResults = []
        
        //
        
        searchPerformed = true
        tableView.reloadData()
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchPerformed {
            return searchResults.count != 0 ? searchResults.count : 1
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.searchResultCell, for: indexPath) as! SearchResultCell
        
        if searchResults.count == 0 {
            cell.nameLabel.text = "(Nothing found)"
            // cell.detailTextLabel!.text = ""
        }
        else {
            let searchResult = searchResults[indexPath.row]
            
            cell.nameLabel.text = searchResult.name
            cell.artistNameLabel.text = searchResult.artistName
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return !searchResults.isEmpty ? indexPath : nil
    }
}