//
//  RegisterViewController.swift
//  MC3login
//
//  Created by Fauzi Fauzi on 23/08/19.
//  Copyright © 2019 fauzify. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    let buttonSegueIdentifier = "toEdit"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.isEnabled = false

        // Do any additional setup after loading the view.
    }
    @IBAction func checkBoxTos(_ sender: UIButton) {
        if (sender.isSelected == true)
        {
            sender.setImage(UIImage(named: "ic_checked"), for: UIControl.State.normal)
            sender.isSelected = false
            
            registerButton.isEnabled = true
            //action kalau unchecked
            
        }
        else
        {
            sender.setImage(UIImage(named: "ic_unchecked"), for: UIControl.State.normal)
            sender.isSelected = true
            //action kalau checked
            registerButton.isEnabled = false

        }
    }
    
    
    @IBAction func RegisterAction(_ sender: Any) {
        let phoneTFLength = phoneTF.text!.count
        let passTFLength = passwordTF.text!.count

        if emailTF.text!.isEmpty || phoneTF.text!.isEmpty || passwordTF.text!.isEmpty {
            showAlert(title: "Alert", message: "All text field must be filled")
            
        } else if phoneTFLength < 8 {
            showAlert(title: "Alert", message: "Fill valid phone number")
        } else if passTFLength < 4 {
            showAlert(title: "Alert", message: "Fill valid password number")
        } else {
            //success
            performSegue(withIdentifier: buttonSegueIdentifier, sender: registerButton)
        }
    }
    
    
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            self.alert(message: message , title: title)
        }
    }
    
}
