//
//  AppCell.swift
//  Examen
//
//  Created by Alumno on 12/15/17.
//  Copyright © 2017 Area51 Training Center. All rights reserved.
//

import UIKit

protocol AppCellDelegate {
    func itemSelected(item: IndexPath)
}

class AppCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var delegate: AppCellDelegate?
    var section: Int!
    var apps: [App]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: UICollectionViewDataSource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath)
        
        //apps[indexPath.item].name
        return cell
    }
    
    //MARK: UICollectionViewDelegate method
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.itemSelected(item: IndexPath(item: indexPath.item, section: section))
    }
    
    

}
