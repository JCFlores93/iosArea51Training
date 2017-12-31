//
//  UsersCollectionViewController.swift
//  Clase 3
//
//  Created by Admin on 11/29/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import MagicalRecord

class UsersCollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var users: [User]!

    override func viewDidLoad() {
        super.viewDidLoad()
        customLayout()
        loadUsersFromCoreData()
        collectionView?.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func customLayout() {
        
        let width = (view.frame.size.width - 20) / 2
        let height = CGFloat(160)
        
        let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: height)
        
    }
    func loadUsersFromCoreData() {
        users = User.mr_findAll() as! [User]
    }
    func saveInCoreData(picture: UIImage) {
        
        MagicalRecord.save({ (context) in

            let newUser = User.mr_createEntity(in: context)!
            newUser.picture = UIImageJPEGRepresentation(picture, 1)
            
        }) { (success, error) in
            
            if success {
                self.loadUsersFromCoreData()
                self.collectionView?.insertItems(at: [IndexPath(row: self.collectionView!.numberOfItems(inSection: 0), section: 0)])
            }else {
                print(error?.localizedDescription)
            }
            
        }
        
    }
    @IBAction func takepictureeButton() {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            
            present(picker, animated: true, completion: nil)
            
        }
 
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let picture = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            dismiss(animated: true, completion: {
                self.saveInCoreData(picture: picture)
            })
            
        }else {
            print(":(")
        }

    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let user = users[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath) as! UserCell
        cell.picture.image = UIImage(data: user.picture!)
        
        return cell
        
    }

}
