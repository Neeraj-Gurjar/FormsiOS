//
//  ViewController.swift
//  Forms_iOS
//
//  Created by bitcot on 02/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstName_TEXTF: UITextField!
    @IBOutlet weak var LastName_TEXTF: UITextField!
    @IBOutlet weak var email_TEXTF: UITextField!
    @IBOutlet weak var password_TEXTF: UITextField!
    @IBOutlet weak var passwordValidationLabel:UILabel!
    
    @IBOutlet weak var saveButton:UIButton!
    
    var textFields:[UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstName_TEXTF.delegate = self
        LastName_TEXTF.delegate = self
        email_TEXTF.delegate = self
        password_TEXTF.delegate = self
        
        textFields = [firstName_TEXTF,LastName_TEXTF,email_TEXTF,password_TEXTF]
        
        passwordValidationLabel.textColor = .red
        
        setupMethod()
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(notification:)), name: Notification.Name(UITextField.textDidChangeNotification.rawValue), object: nil)
    }
    
    
    fileprivate func validate(_ textField: UITextField) -> (Bool, String?) {
        guard let text = textField.text else {
            return (false, nil)
        }

        if textField == password_TEXTF {
            return (text.count >= 6, "Your password is too short.")
        }

        return (text.count > 0, "This field cannot be empty.")
    }

    private func setupMethod(){
        saveButton.isEnabled = false
        
        passwordValidationLabel.isHidden = true
    }
    
    @objc private func textDidChange(notification:Notification){
        var formisValid = true
        
        for textField in textFields {
            let (valid, _) = validate(textField)
            
            guard valid else {
                formisValid = false
                break
            }
        }
        saveButton.isEnabled = formisValid
    }


}
extension ViewController :UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstName_TEXTF:
            LastName_TEXTF.becomeFirstResponder()
        case LastName_TEXTF:
            password_TEXTF.becomeFirstResponder()
        case password_TEXTF:
            let (valid, message) = validate(textField)
            
            if valid{
                email_TEXTF.becomeFirstResponder()
            }
            self.passwordValidationLabel.text = message
            
            UIView.animate(withDuration: 0.25, animations: {
                self.passwordValidationLabel.isHidden = valid
            })
            
        default:
            email_TEXTF.resignFirstResponder()
        }
        return true
    }
}
