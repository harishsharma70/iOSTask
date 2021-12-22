//
//  TableViewCell.swift
//  PopUp
//
//  Created by apple on 30/09/1400 AP.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    //    MARK: - Variable
    var namelbl = ["monitor","cpu","mouse","keyboard","ups","hardware","mouse","keyboard","ups","hardware"]
    var citylbl = ["monitor","cpu","mouse","keyboard","ups","hardware","mouse","keyboard","ups","hardware"]
    var computerImage = [
        UIImage.init(named: "computer 1"),
        UIImage.init(named: "computer 2"),
        UIImage.init(named: "computer 3"),
        UIImage.init(named: "computer 4"),
        UIImage.init(named: "computer 5"),
        UIImage.init(named: "computer 6"),
        UIImage.init(named: "computer 7"),
        UIImage.init(named: "computer 8"),
        UIImage.init(named: "computer 9"),
        UIImage.init(named: "computer 10")
    ]
    
    
    //    MARK: - Outlet
    @IBOutlet weak var CollectionView: UICollectionView!
    
    //    MARK: - LifeCycle Of TableViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        
        CollectionView.dataSource = self
        CollectionView.delegate = self
        self.CollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//    MARK: - Extension TableViewCell
extension TableViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return namelbl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.nameLabel.text = namelbl[indexPath.row]
        cell.cityLabel.text = citylbl[indexPath.row]
        cell.ImageView.image = computerImage[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 - 20, height: 200)
    }
}
