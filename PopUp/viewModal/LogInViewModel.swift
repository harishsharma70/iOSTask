//
//  UserViewModel.swift
//  PopUp
//
//  Created by apple on 23/09/1400 AP.
//

import Foundation

class LogInViewModel {

    var arrLogin = [LoginModel]()

    func getAllLogInData(){
        
        URLSession.shared.dataTask(with: URL(string: "https://reqres.in/api/login")!) { (data, response, error)
            in
            if error == nil {
                if let data = data {
                    do {
                        let userResponse = try JSONDecoder().decode(LoginModel.self, from: data)
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
