//
//  RegisterViewController.swift
//  Easy Shopping
//
//  Created by Oscar Ruiz patricio on 5/6/17.
//  Copyright © 2017 Oscar Ruiz patricio. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private var user: User? = nil
    public var session: Session? = nil


    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nickTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        //Comprobar campos
        if !checkFields() {
            let alert = UIAlertController(title: "Error", message: "Debes rellenar todos los campos correctamente", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            //guardar datos de usuario
            user = User(email: emailTextField.text!, nick: nickTextField.text!)
            
            let userToSave = NSKeyedArchiver.archivedData(withRootObject: user)
            let defaults = UserDefaults.standard
            defaults.setValue(userToSave, forKey: "user")
            
            //Ir a home
            let viewController:UITabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
            self.present(viewController, animated: true, completion: nil)        }
    }
    
    func checkFields()  -> Bool {
        var fieldsOk = false
        
        if emailTextField.text != "" && nickTextField.text != "" {
            fieldsOk = true
        }
        
        return fieldsOk
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
