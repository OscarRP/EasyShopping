//
//  ListDetailViewController.swift
//  Easy Shopping
//
//  Created by Oscar Ruiz patricio on 14/6/17.
//  Copyright © 2017 Oscar Ruiz patricio. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var products = [Product]()
    public var shoppingList: ShoppingList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        products = (shoppingList?.products)!
        // Do any additional setup after loading the view.
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! ListDetailTableViewCell
        
        cell.name.text = products[indexPath.row].productName
        cell.quantity.text = products[indexPath.row].quantity
        
        return cell
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
