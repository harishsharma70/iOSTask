//
//  GetViewController.swift
//  PopUp
//
//  Created by apple on 22/09/1400 AP.
//

import UIKit

class GetViewController: UIViewController {

    var viewModelLogIn = LogInViewModel()
    
//    var arrayValue = [[String: Any]]()
//    var dict = [String: AnyObject]()

    @IBOutlet weak var usernameTxtFld: UITextField!
    @IBOutlet weak var passwodTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModelLogIn.getAllLogInData()
        
    }
    @IBAction func loginBttnTapped(_ sender: UIButton) {
        
        viewModelLogIn.getAllLogInData()
        
    }
}
