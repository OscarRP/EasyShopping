//
//  SplashViewController.swift
//  Easy Shopping
//
//  Created by Oscar Ruiz patricio on 5/6/17.
//  Copyright © 2017 Oscar Ruiz patricio. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    private var user: User? = nil
    public var session: Session? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //Se comprueba UserDefaults para ver si el usuario ya se ha registrado
        let defaults = UserDefaults.standard
        
        //si se ha registrado se va a home
        if let userRegistered = defaults.data(forKey: "user") {
            if let loadedUser = NSKeyedUnarchiver.unarchiveObject(with: userRegistered) as? User {
                //Cambiar de view controller y guardar el usuario
                session = Session(user: loadedUser)
                performSegue(withIdentifier: "homeSegue", sender: self)
            }
            
        } else {
            //cambio de View Controller a Registro
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as UIViewController
            self.present(viewController, animated: true, completion: nil)
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
