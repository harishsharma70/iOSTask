//
//  TimerViewController.swift
//  PopUp
//
//  Created by apple on 22/09/1400 AP.
//

import UIKit

class TimerViewController: UIViewController {

    var currentDate = Date()
    var nextDate = Date()
    
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSecondCounter), userInfo: nil, repeats: true)
        nextDate =  Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!

    }
    @objc func updateSecondCounter() {
        
        var calendar = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: nextDate)
        hoursLabel.text = calendar.hour?.description
        minuteLabel.text = calendar.minute?.description
        secondLabel.text = calendar.second?.description
        daysLabel.text = "1"
}
}
