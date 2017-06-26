//
//  ProfileViewController.swift
//  Easy Shopping
//
//  Created by Oscar Ruiz patricio on 5/6/17.
//  Copyright © 2017 Oscar Ruiz patricio. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func selectPhoto(_ sender: Any) {
        
        let alert = UIAlertController(title: "Selecciona origen", message: "Selecciona de dónde quieres coger la foto", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cámara", style: .default, handler: {action in self.camera()}))
        alert.addAction(UIAlertAction(title: "Galeria", style: .default, handler: {action in self.photoLibrary()}))
        present(alert, animated: true, completion: nil)
    }
    
    func camera() {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func photoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            //Podemos elegir .camera
            imagePicker.sourceType  = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoProfile.image = selectedImage
            photoProfile.contentMode = .scaleAspectFill
            photoProfile.clipsToBounds = true
        }
        
        self.dismiss(animated: true, completion: nil)
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
