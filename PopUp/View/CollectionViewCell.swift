//
//  CollectionViewCell.swift
//  PopUp
//
//  Created by apple on 30/09/1400 AP.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
//    MARK: - Outlet
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    //    MARK: - LifeCycle Of CollectionViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 15
        mainView.layer.shadowColor = UIColor.lightGray.cgColor
        mainView.layer.shadowOpacity = 1
        mainView.layer.shadowOffset = CGSize.zero
        mainView.layer.shadowRadius = 5
//        mainView.layer.masksToBounds = false

    }

}
