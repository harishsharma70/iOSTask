//
//  ViewController.swift
//  PopUp
//
//  Created by apple on 15/09/1400 AP.
//

import UIKit
protocol popUpViewControllerDelegate {
    func yesBttnTapped(text:String)
}

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var popView: UIView!
    @IBOutlet var visualEffectView: UIView!
    var tittleValue = String()
    var delegate : popUpViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tittleLabel.text = "tittleValue"
        setupLayout()
    }
    
    @IBAction func yesButtonAction(_ sender: UIButton) {
        delegate?.yesBttnTapped(text: "")
    }
    
    @IBAction func noButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseInOut) {
            self.popView.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
            self.popView.alpha = 0
            self.visualEffectView.alpha = 0
            self.view.backgroundColor = .clear
        } completion: { _ in
            DispatchQueue.main.async {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    private func setupLayout() {
        self.popView.alpha = 0
        self.visualEffectView.alpha = 0
        self.popView.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
        popView.layer.cornerRadius = 20
        popView.layer.shadowColor = UIColor.lightGray.cgColor
        popView.layer.shadowOpacity = 0.2
        popView.layer.shadowOffset = CGSize.zero
        popView.layer.shadowRadius = 15
        self.view.backgroundColor = .clear
    }
}

