//
//  DetailViewController.swift
//  Contacts
//
//  Created by Vaibhav Anand on 2020-11-18.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var contactName: UITextField!
    @IBOutlet weak var contactPhoneNumber: UITextField!
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactIsFav: UIImageView!
    
    var person: Person!
    let imagePicker = UIImagePickerController()
    private let unfavdImage = UIImage(systemName: "heart")
    private let favImage = UIImage(systemName: "heart.fill")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactIsFav.tintColor = UIColor.systemPink
        contactName.text = person.name
        contactPhoneNumber.text = String(person.phoneNumber)
        if (person.isFavorite) {
            contactIsFav.image = favImage
        } else {
            contactIsFav.image = unfavdImage
        }
        if(person.image != nil) {
            contactImage.image = person.image
        }
        
        // Do any additional setup after loading the view.
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        doubleTap.numberOfTapsRequired = 2
        contactImage.addGestureRecognizer(doubleTap)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        contactImage.isUserInteractionEnabled = true
        contactImage.addGestureRecognizer(tapGestureRecognizer)
        
        tapGestureRecognizer.require(toFail: doubleTap)
    }
    
    @objc func doubleTapped() {
        person.isFavorite = !person.isFavorite
        if(person.isFavorite) {
            contactIsFav.image = favImage
        }
        else if(!person.isFavorite) {
            contactIsFav.image = unfavdImage
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let _ = tapGestureRecognizer.view as! UIImageView
        // check source type
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        // put image on screen
        contactImage.image = image
        person.image = image
        
        dismiss(animated: true, completion: nil)
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

