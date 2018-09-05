//
//  SearchTableViewController.swift
//  Tracros
//
//  Created by Jake Gray on 7/27/18.
//  Copyright © 2018 Jake Gray. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var selectedFood: SearchFoodItem?
    
    var items: [SearchItem] = [] {
        didSet{
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        
        searchTableView.dataSource = self
        searchTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toItemDetailVC" {
            guard let destination = segue.destination as? SearchDetailTableViewController else {return}
            print("destination")
            destination.foodItem = selectedFood
            
        }
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell Pressed")
        let id = items[indexPath.row].ndbno
        FoodCompositionResultsController.fetchItem(withID: id) { (item) in
            if let item = item {
                print("Item Fetched")
                self.selectedFood = item
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toItemDetailVC", sender: self)

                }
            }
            
            
        }
    }

}

extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("did end editing")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        view.endEditing(true)
        
        guard let term = searchBar.text, !term.isEmpty else {return}
        
        ItemSearchController.searchForItem(withTerm: term) { (items) in
            if let items = items {
                self.items = items
            } else {
                print("No Items")
            }
        }
    }
}
