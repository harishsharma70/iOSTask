//
//  ProfileViewController.swift
//  PopUp
//
//  Created by apple on 19/09/1400 AP.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func backBttnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
