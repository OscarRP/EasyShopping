//
//  AddListViewController.swift
//  Easy Shopping
//
//  Created by Oscar Ruiz patricio on 12/6/17.
//  Copyright © 2017 Oscar Ruiz patricio. All rights reserved.
//

import UIKit

class AddListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var name = ""
    private var quantity = "0"
    private var listName = ""
    
    private var products = [Product]()
    private var shoppingList: ShoppingList?
    private var shoppingLists = [ShoppingList]()
    
    @IBOutlet weak var productsListTableView: UITableView!
    
    @IBOutlet weak var listNameTextField: UITextField!
    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Coger las listas guardadas si las hay
        let defaults = UserDefaults.standard
        if let areSavedShoppingLists = defaults.data(forKey: "shoppingLists") {
            print("aresavedshoppinglists")
            if let savedShoppingLists = NSKeyedUnarchiver.unarchiveObject(with: areSavedShoppingLists) as? [ShoppingList] {
                print("savedshoppinglists")
                shoppingLists = savedShoppingLists
                print(shoppingLists.count)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addListCell", for: indexPath) as! AddListTableViewCell
        
        cell.productName.text = products[indexPath.row].productName
        cell.productQuantity.text = products[indexPath.row].quantity
        
        return cell
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        //Comprobar campo nombre o poner nombre por defecto
        if listNameTextField.text == "" {
            listName = "Lista sin nombre"
        } else {
            listName = listNameTextField.text!
        }
        //Se crea la lista de la compra a partir del array de productos
        shoppingList = ShoppingList(name: listName, products: products)
       
        
        //Se añade la lista de la compra al array de listas de la compra
        shoppingLists.append(shoppingList!)
        if shoppingLists.count == 0 {
            print ("No se ha añadido la shopping list")
        } else if shoppingLists.count == 1 {
            print ("si se ha añadido")
        }
        
        //Guardar la lista
        saveList()
        
        //Volver atrás
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        //Volver a pantalla anterior sin guardar
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addProductButtonPressed(_ sender: Any) {
        //Comprobar que se ha introducido el nombre del producto
        if productNameTextField.text == "" {
            let alert = UIAlertController(title: "Error", message: "Introduce el nombre del producto", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            //Guardar los datos en la lista
            name = productNameTextField.text!
            if quantityTextField.text == "" {
                quantity = "0"
            } else {
                quantity = quantityTextField.text!
            }
            products.append(Product(productName: productNameTextField.text!, quantity: quantityTextField.text!))
            
            //Vaciar los campos de texto
            productNameTextField.text = ""
            quantityTextField.text = ""
            
            productsListTableView.reloadData()
        }
    }
    
    func saveList() {
        
        let shoppingListsToSave = NSKeyedArchiver.archivedData(withRootObject: shoppingLists)
        let defaults = UserDefaults.standard
        defaults.setValue(shoppingListsToSave, forKey: "shoppingLists")
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
