//
//  CollectionViewController.swift
//  PopUp
//
//  Created by apple on 29/09/1400 AP.
//

import UIKit

class CollectionViewController: UIViewController {
    
    //     MARK: IB Outlet
    @IBOutlet weak var gridCollectioView: UICollectionView!
    
    //         MARK: Variables
    var viewModelEmail = EmailViewModel()
    let myGroup = DispatchGroup()
    
    //     MARK: LifeCycle Of ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gridCollectioView.dataSource = self
        gridCollectioView.delegate  = self
        myGroup.enter()
        viewModelEmail.getEmailData {
            self.myGroup.leave()
        }
        myGroup.notify(queue: DispatchQueue.main) {
            self.gridCollectioView.reloadData()
            
        }
        self.gridCollectioView.register(UINib(nibName: "GridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GridCollectionViewCell")
    }
}

//     MARK: Extension ViewController
extension CollectionViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModelEmail.arrEmail.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gridCollectioView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath) as! GridCollectionViewCell
        let modelEmail = viewModelEmail.arrEmail[indexPath.row]
        let imageUrl = URL(string: modelEmail.avatar)!
        let imageData = try! Data(contentsOf: imageUrl)
        let Image = UIImage(data: imageData)
        cell.gridfirstLabel.text = "\(modelEmail.email)"
        cell.gridsecondLabel.text = "\(modelEmail.id)"
        cell.gridImageView.image = Image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 - 20, height: 100)
    }
}
