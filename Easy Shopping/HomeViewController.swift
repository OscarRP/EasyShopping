//
//  ViewController.swift
//  Easy Shopping
//
//  Created by Oscar Ruiz patricio on 29/5/17.
//  Copyright © 2017 Oscar Ruiz patricio. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITabBarDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var cellTitle: String?
    private var firstDescription: String?
    private var secondDescription: String?
    private var image: UIImage?
    private var link: String?
    
    @IBOutlet weak var tabBar: UITabBar!
    
    //Variable que almacena los datos de las celdas
    private var pages = [HomePageModel]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    //Función donde se pone la información en las celdas
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let homeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionViewCell
        
        homeCell.title.text = pages[indexPath.row].title
        homeCell.firstDescription.text = pages[indexPath.row].firstDescription
        homeCell.secondDescription.text = pages[indexPath.row].secondDescription
       // homeCell.link.setTitle(pages[indexPath.row].link, for: .normal)
        homeCell.image.image = pages[indexPath.row].image
        
        return homeCell
    }

    //Función para inicializar los datos en el array de celdas
    func setData() {
        cellTitle = "Gestiona tus listas de la compra y controla el gasto"
        firstDescription = "- Crea, edita y guarda tus propias listas"
        secondDescription = "- Controla el gasto en el momento de hacer la compra"
        link = "Empieza aquí"
        image = #imageLiteral(resourceName: "promo")
        pages.append(HomePageModel(title: cellTitle!, firstDescription: firstDescription!, image: image!, link: link!))
        
        cellTitle = "Consulta las ofertas de los principales supermercados"
        firstDescription = "- Te indicamos las ofertas actuales"
        link = "Empieza aquí"
        image = #imageLiteral(resourceName: "promo")
        pages.append(HomePageModel(title: cellTitle!, firstDescription: firstDescription!, image: image!, link: link!))
        
        cellTitle = "Te mostramos los supermercados cercanos a tí"
        firstDescription = "- Pulsa sobre los marcadores para ver la información"
        link = "Empieza aquí"
        image = #imageLiteral(resourceName: "map")
        pages.append(HomePageModel(title: cellTitle!, firstDescription: firstDescription!, image: image!, link: link!))
        
        cellTitle = "Gestiona tu perfil"
        firstDescription = "- cambia la contraseña"
        link = "Empieza aquí"
        image = #imageLiteral(resourceName: "promo")
        pages.append(HomePageModel(title: cellTitle!, firstDescription: firstDescription!, image: image!, link: link!))
    }
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showListsSegue" {
            let destinatinoController = segue.destination as! MyListsViewController
        }
    }

}

