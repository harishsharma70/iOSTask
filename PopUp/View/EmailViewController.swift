//
//  EmailViewController.swift
//  PopUp
//
//  Created by apple on 23/09/1400 AP.
//

import UIKit

class EmailViewController: UIViewController {
    
    @IBOutlet weak var emailTableView: UITableView!
    var viewModelEmail = EmailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelEmail.getEmailData {
            DispatchQueue.main.async {
                self.emailTableView.reloadData()
            }
        }
        emailTableView.delegate = self
        emailTableView.dataSource = self
    }
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
}

extension EmailViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelEmail.arrEmail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = emailTableView.dequeueReusableCell(withIdentifier: "EmailTableViewCell", for: indexPath) as! EmailTableViewCell
        let modelEmail = viewModelEmail.arrEmail[indexPath.row]
        let imageUrl = URL(string: modelEmail.avatar)!
        let imageData = try! Data(contentsOf: imageUrl)
        let Image = UIImage(data: imageData)
        
        cell.usernameLabel.text = "\(modelEmail.email)"
        cell.idLabel.text = "\(modelEmail.id)"
        cell.emailImgView.image = Image
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
        
    }
}
