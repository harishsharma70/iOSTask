//
//  GetViewController.swift
//  PopUp
//
//  Created by apple on 22/09/1400 AP.
//

import UIKit

class GetViewController: UIViewController {

    var arrayValue = [[String: Any]]()
    var dict = [String: AnyObject]()

    @IBOutlet weak var usernameTxtFld: UITextField!
    @IBOutlet weak var passwodTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
        
    }
    @IBAction func loginBttnTapped(_ sender: UIButton) {
        
        getData()

    }
        
        func getData() {
            var name = usernameTxtFld.text ?? ""
            var passwrd = passwodTxtFld.text ?? ""
            var request = URLRequest(url: URL(string: "https://reqres.in/api/login")!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
                print(response!)
                do {
                    let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                    print(json)
                    
                    self.dict = json
                } catch {
                    print("error")
                }
            })

            task.resume()
        }
        
}
