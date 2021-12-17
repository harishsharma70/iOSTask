//
//  SignUpViewController.swift
//  PopUp
//
//  Created by apple on 24/09/1400 AP.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var viewModelSignUp = SignUpViewModel()
    
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signupBttnTapped(_ sender: UIButton) {
        
        if ((emailTxtFld.text?.isValidEmail) == false){
            let alert = UIAlertController(title: "Vayy", message: "Please check your Email",preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default,handler : { _ in
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else if passwordTxtFld.text?.isValidPassword == false {
            let alert = UIAlertController(title: "Vayy", message: "Please check your Password",preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default,handler : { _ in
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            viewModelSignUp.getSignUpData(email:emailTxtFld.text! , password: passwordTxtFld.text!) {
                DispatchQueue.main.async {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "EmailViewController") as! EmailViewController
                    UIApplication.shared.windows.first?.rootViewController = vc
                    UIApplication.shared.windows.first?.makeKeyAndVisible()
                }
            }
        }
    }
}

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
extension String {
    var isValidPassword : Bool{
        
        if self.count < 6 || self.count > 8 {
            return false
        }
        return true
    }
}
