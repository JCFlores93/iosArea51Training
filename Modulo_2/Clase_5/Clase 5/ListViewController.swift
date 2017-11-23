//
//  ListViewController.swift
//  Clase 5
//
//  Created by Alumno on 11/13/17.
//  Copyright © 2017 Franti Saúl Huamán Mera. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UICollectionViewController {
    
    var eventos = [NSManagedObject]()
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        customLayout()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Evento")
        
        //Get context
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let context = appDelegate.persistent.viewContext
        
        do {//NSPersistentStoreResult

            let result = try context.fetch(fetchRequest)
            self.eventos = result
            self.collectionView?.reloadData()
        }catch {
            
        }

    }
    
    //MARK: IBAction methods
    func customLayout() {
        
        let width = (view.frame.size.width-20)/2
        let height = CGFloat(150)
        
         let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.itemSize = CGSize(width: width, height: height)
    }
    func addNewEvent(_ name: String, desc: String) {
        
        //Reques NSManagedContext
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            //si falla
            return
        }
        let context = appDelegate.persistent.viewContext
        
        //Create NSManagedObject
        let description = NSEntityDescription.entity(forEntityName: "Evento", in: context)!
        let newEvento = NSManagedObject(entity: description, insertInto: context)
        newEvento.setValue(name, forKey: "name")
        newEvento.setValue(desc, forKey: "desc")
        
        do {
            //Guardar en persistencia
            try context.save()
            eventos.append(newEvento)
            
            collectionView?.insertItems(at: [IndexPath(item: eventos.count-1, section: 0)])
            
        }catch  {
            
        }
  
    }
    @IBAction func addItemButton() {
        
        let alert = UIAlertController(title: "Nuevo evento", message: "Se agregará a la base de datos", preferredStyle: .alert)
        
        //Add actions
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        alert.addAction(UIAlertAction(title: "Agregar", style: .default, handler: { (action) in
            
            if let name = alert.textFields?[0].text, let desc = alert.textFields?[1].text {
                
                if name.characters.count != 0 && desc.characters.count != 0 {
                    
                    self.addNewEvent(name, desc: desc)
                    
                }

            }else {
                print("datos incompletos")
            }

        }))
        
        //Add textfields
        alert.addTextField { (textField) in
            textField.returnKeyType = .next
            textField.placeholder = "Insertar nombre"
            textField.keyboardType = .default
        }
        alert.addTextField { (textField) in
            textField.returnKeyType = .done
            textField.placeholder = "Insertar descripción"
            textField.keyboardType = .default
        }

        present(alert, animated: true, completion: nil)
        
    }


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventos.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UIImageJPEGRepresentation(<#T##image: UIImage##UIImage#>, <#T##compressionQuality: CGFloat##CGFloat#>)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! EventoCell
        
        let evento = eventos[indexPath.item]
        
        cell.title.text = evento.value(forKey: "name") as? String
        cell.summary.text = evento.value(forKey: "desc") as? String

        return cell
    }

}
