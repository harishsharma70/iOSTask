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

        // Do any additional setup after loading the view.
    }
    @IBAction func backBttnTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
