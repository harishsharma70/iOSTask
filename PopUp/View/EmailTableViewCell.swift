//
//  EmailTableViewCell.swift
//  PopUp
//
//  Created by apple on 23/09/1400 AP.
//

import UIKit

class EmailTableViewCell: UITableViewCell {
    
    //     MARK: - Outlet
    @IBOutlet weak var emailImgView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    //     MARK: - LifeCycle Of TableViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
