//
//  EmailTableViewCell.swift
//  PopUp
//
//  Created by apple on 23/09/1400 AP.
//

import UIKit

class EmailTableViewCell: UITableViewCell {

    @IBOutlet weak var emailImgView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
