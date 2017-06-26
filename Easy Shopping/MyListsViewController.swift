//
//  MyListsViewController.swift
//  Easy Shopping
//
//  Created by Oscar Ruiz patricio on 31/5/17.
//  Copyright © 2017 Oscar Ruiz patricio. All rights reserved.
//

import UIKit

class MyListsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var myLists = [ShoppingList]()
    private var numberOfItems = 0
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //se cargan las listas
        let defaults = UserDefaults.standard
        if let savedLists = defaults.data(forKey: "shoppingLists") {
            print (savedLists)
            if let loadedLists = NSKeyedUnarchiver.unarchiveObject(with: savedLists) as? [ShoppingList] {
                myLists = loadedLists
                tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyListsCell", for: indexPath) as! MyListsCell
        
        numberOfItems = myLists[indexPath.row].products.count
        
        cell.listName.text = myLists[indexPath.row].name
        
        cell.firstItem.text = myLists[indexPath.row].products[0].productName
        
        if numberOfItems > 1 {
            cell.secondItem.text = myLists[indexPath.row].products[1].productName
            if numberOfItems > 2 {
                cell.thirdItem.text = myLists[indexPath.row].products[2].productName
            } else {
                cell.thirdItem.text = ""
            }
        } else {
            cell.secondItem.text = ""
        }
        
        return cell
    }
    @IBAction func deleteLists(_ sender: Any) {
        let alert = UIAlertController(title: "Borrar Listas", message: "¿Quieres borrar todas tus listas de compra?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: removeLists))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func removeLists(action: UIAlertAction) {
        //se borran las listas
        myLists.removeAll()
        //se guarda el resultado
        saveList()
        //se actualiza la tabla
        tableView.reloadData()
    }
    
    func saveList() {
        
        let shoppingListsToSave = NSKeyedArchiver.archivedData(withRootObject: myLists)
        let defaults = UserDefaults.standard
        defaults.setValue(shoppingListsToSave, forKey: "shoppingLists")
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showListDetail" {
            if let IndexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! ListDetailViewController
                destinationController.shoppingList = myLists[IndexPath.row]
            }
        }
    }
    

}
