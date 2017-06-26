//
//  OffersViewController.swift
//  Easy Shopping
//
//  Created by Oscar Ruiz patricio on 5/6/17.
//  Copyright © 2017 Oscar Ruiz patricio. All rights reserved.
//

import UIKit
import Parse

class OffersViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var offers = [Offers]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getOffers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print (offers.count)
        return offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath) as! OffersCollectionViewCell
        
        cell.market.text = offers[indexPath.row].market
        cell.title.text = offers[indexPath.row].title
        cell.descripcion.text = offers[indexPath.row].description
        cell.date.text = offers[indexPath.row].endDate
        
        //cargar la imagen
        cell.image.image = UIImage()
        
        //se comprueba si se ha descargado la imagen
        if let featuredImage = offers[indexPath.row].image {
            featuredImage.getDataInBackground(block: { (imageData, error) in
                if let offerImageData = imageData {
                    cell.image.image = UIImage(data: offerImageData)
                }
            })
        }
        
        return cell
    }
    
    
    /*
     Método para coger las ofertas del servidor
    */
    func getOffers() {
        
        //se vacia el array
        offers.removeAll(keepingCapacity: true)
        collectionView.reloadData()
        
        //Pull de la info en parse
        let query = PFQuery(className: "Offers")
        
        //si no hay internet, se coge la información de la caché
        query.cachePolicy = PFCachePolicy.networkElseCache
        
        
        query.findObjectsInBackground { (objects, error) in
            if let error = error {
                print ("Error: \(error)")
                return
            }
            
            if let objects = objects {
                for (index, object) in objects.enumerated() {
                    //se coge cada oferta y se añade al array de ofertas
                    let offer = Offers(pfObject: object)
                    print(offer.market)
                    self.offers.append(offer)
                    
                    //se añaden las ofertas al collection view
                    let indexPath = IndexPath(row: index, section: 0)
                    self.collectionView.insertItems(at: [indexPath])
                }
            }
        }
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
