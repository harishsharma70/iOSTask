//
//  SignUpViewModel.swift
//  PopUp
//
//  Created by apple on 24/09/1400 AP.
//

import Foundation

class SignUpViewModel {
    
    //     MARK: - Variable
    var arrSignUp = [SignUpModel]()
    
    //     MARK: - Function SignUp Data
    func getSignUpData(email:String,password:String, completionHandler: @escaping () -> Void){
        let params = [
            "email" : email,
            "password" : password,
        ]
        let url = URL(string: "https://reqres.in/api/register")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONSerialization.data(withJSONObject: params, options: .sortedKeys)
        request.httpMethod = "POST"
        
        //     MARK: - API Hitting
        URLSession.shared.dataTask(with: request) { (data, response, error)
            in
            if error == nil {
                if let data = data {
                    do {
                        let userResponse =  try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
                        let token = userResponse?["token"] as? String ?? ""
                        UserDefaults.standard.set(token, forKey: "tokenKey")
                        completionHandler()
                        print(userResponse)
                    }
                    catch let err{
                        print(err.localizedDescription)
                    }
                }
            }else{
                print(error?.localizedDescription)
            }
        }.resume()
    }
}
    //     MARK: - Alert Action Function
//    func alertAction(){
//        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: UIAlertController.Style.alert)
//        let cancelAction = UIAlertAction(title: "Cancel", style:UIAlertAction.Style.default) { (action) in
//        }
//        let okayAction = UIAlertAction(title: "OK", style: .Default) { (action) in
//        }
//        alertController.addAction(okayAction)
//        alertController.addAction(cancelAction)
//    }
//}

