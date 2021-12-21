//
//  GridCollectionViewCell.swift
//  PopUp
//
//  Created by apple on 29/09/1400 AP.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var gridImageView: UIImageView!
    @IBOutlet weak var gridfirstLabel: UILabel!
    @IBOutlet weak var gridsecondLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        gridImageView.layer.cornerRadius = 10
        
    }

}
