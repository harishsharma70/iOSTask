//
//  SignUpViewModel.swift
//  PopUp
//
//  Created by apple on 24/09/1400 AP.
//

import Foundation

class SignUpViewModel {
    
    var arrSignUp = [SignUpModel]()
    
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
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error)
            in
            if error == nil {
                if let data = data {
                    do {
//                        let userResponse = try JSONDecoder().decode(SignUpModel.self, from: data)
                        let userResponse =  try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
//                        self.arrSignUp = userResponse.data
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
