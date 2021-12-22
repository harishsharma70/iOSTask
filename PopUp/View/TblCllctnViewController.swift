//
//  TblCllctnViewController.swift
//  PopUp
//
//  Created by apple on 30/09/1400 AP.
//

import UIKit

class TblCllctnViewController: UIViewController {
    
    //    MARK: - Outlet
    @IBOutlet weak var TableView: UITableView!
    
    //    MARK: - LifeCycle Of ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//    MARK: - Extension TblCllctnViewController
extension TblCllctnViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = TableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
}
