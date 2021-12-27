//
//  SearchViewController.swift
//  PopUp
//
//  Created by apple on 01/10/1400 AP.
//

import UIKit

class SearchViewController: UIViewController {
    
    //    MARK: - Variables
    var name = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
                "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
                "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
                "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
                "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
//    var search = [String]()
    var viewModelSearch = SearchViewModel()
    
    //    MARK: - Outlet
    @IBOutlet weak var mainSearchBar: UISearchBar!
    @IBOutlet weak var filterTableView: UITableView!
    
    //    MARK: - LifeCycle Of ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        filterTableView.dataSource = self
        filterTableView.delegate = self
        mainSearchBar.delegate = self
//        search = name
        viewModelSearch.getSearchData(text: mainSearchBar.text ?? "") {
            DispatchQueue.main.async { [self] in
                self.filterTableView.reloadData()
            }
        }
    }
}

//    MARK: - Extension SearchViewController Of TableView
extension SearchViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelSearch.Search.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = filterTableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        let modelSearch = viewModelSearch.Search[indexPath.row]
        cell.filterLabel?.text = "\(modelSearch.name)"
        return cell
    }
}
    
    //    MARK: - Extension SearchBar Delegate
    extension SearchViewController: UISearchBarDelegate{
        func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
                //        search = text.isEmpty ? name : name.filter({(dataString: String) -> Bool in
                //            return dataString.range(of: text, options: .caseInsensitive) != nil
                //        })
                viewModelSearch.getSearchData(text: mainSearchBar.text ?? "") {
                    DispatchQueue.main.async { [self] in
                        self.filterTableView.reloadData()
                    }
                }
                return true
            }
        }
