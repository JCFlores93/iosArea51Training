//
//  UsersViewController.swift
//  Clase03
//
//  Created by Admin on 29/11/17.
//  Copyright © 2017 Area51. All rights reserved.
//

import UIKit
import MagicalRecord


class UsersViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customLayout()
        loadUsersFromCoreData()
        collectionView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath) as! TestViewCell
        cell.imageToSHow.image = UIImage(data: user.picture!)
    
        // Configure the cell
    
        return cell
    }

    func customLayout() {
        let width = (view.frame.size.width - 20)/2
        let height = CGFloat(160)
        
        let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: height)
    }
    
    
    @IBAction func takePictureButton() {
        
       if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            present(picker, animated: true, completion: nil)
        }
    }
    
    func saveInCoreData(picture: UIImage){
        MagicalRecord.save( { (context) in

            let newUser = User.mr_createEntity(in: context)!
            newUser.picture = UIImageJPEGRepresentation(picture, 1)
        }){ (success, error) in
            
            if success{
                self.loadUsersFromCoreData()
                self.collectionView?.insertItems(at:  [IndexPath(row: self.collectionView!.numberOfItems(inSection: 0),section: 0)])
                print("save")
            }else {
                print(error?.localizedDescription)
            }
        }
    }
    
    func loadUsersFromCoreData(){
        users = User.mr_findAll() as! [User]
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
            print(" :( ")
        }
        
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
