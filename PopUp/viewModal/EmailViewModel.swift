//
//  EmailViewModel.swift
//  PopUp
//
//  Created by apple on 23/09/1400 AP.
//

import Foundation

class EmailViewModel {
    
    var arrEmail = [emailDatum]()
    
    
 
    
    func getEmailData(completionHandler: @escaping () -> Void){
        
        URLSession.shared.dataTask(with: URL(string: "https://reqres.in/api/users?page=2")!) { (data, response, error)
            in
            if error == nil {
                if let data = data {
                    do {
                        let userResponse = try JSONDecoder().decode(EmailModel.self, from: data)
                        self.arrEmail = userResponse.data
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
