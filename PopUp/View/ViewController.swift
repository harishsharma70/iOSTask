//
//  ViewController.swift
//  PopUp
//
//  Created by apple on 15/09/1400 AP.
//

import UIKit

class ViewController: UIViewController,popUpViewControllerDelegate {
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func popBttnAction(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PopUpViewController") as! PopUpViewController
        vc.delegate = self
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseInOut) {
            vc.tittleValue = "Are you sure you want to log out"
            vc.view.backgroundColor = UIColor.black
                .withAlphaComponent(0.5)
            vc.popView.alpha = 1
            vc.visualEffectView.alpha = 0.5
            vc.popView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            
        }
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func yesBttnTapped(text: String) {
        print("Yes Button Is Tapped")
    }
}
