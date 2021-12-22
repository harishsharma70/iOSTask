//
//  GetViewController.swift
//  PopUp
//
//  Created by apple on 22/09/1400 AP.
//

import UIKit

class GetViewController: UIViewController {

    //     MARK: - VAriables
    var viewModelLogIn = LogInViewModel()

    //     MARK: - IBOutlet
    @IBOutlet weak var usernameTxtFld: UITextField!
    @IBOutlet weak var passwodTxtFld: UITextField!

    //     MARK: - LifeCycle Of ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModelLogIn.getAllLogInData()
    }
    @IBAction func loginBttnTapped(_ sender: UIButton) {
        
        viewModelLogIn.getAllLogInData()
    }
}
