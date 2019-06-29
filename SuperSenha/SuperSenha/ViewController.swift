//
//  ViewController.swift
//  SuperSenha
//
//  Created by Anderson Alencar on 09/06/19.
//  Copyright © 2019 Anderson Alencar. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tfTotalPassword: UITextField!
    @IBOutlet weak var tfNumberOFCharacters: UITextField!
    @IBOutlet weak var swLowerCaseLetters: UISwitch!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    
    var aux: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tfTotalPassword.delegate = self
        self.tfNumberOFCharacters.delegate = self
        self.navigationController?.navigationBar.tintColor = UIColor(red:0.60, green:0.14, blue:0.40, alpha:1.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Gerador de Senhas"
        self.navigationItem.backBarButtonItem?.title = "Gerador de Senhas"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "SecondViewSegue" {
            let SecondViewController = segue.destination as! SecondViewController

            if let numbersOfPassword = Int(self.tfTotalPassword.text!) {
                SecondViewController.numberOfPasswords = numbersOfPassword
            }
            if let numbersOfCharacters = Int(self.tfNumberOFCharacters.text!) {
                SecondViewController.numberOfCharacters = numbersOfCharacters
            }
            SecondViewController.useLowerCaseLetters = self.swLowerCaseLetters.isOn
            SecondViewController.useCapitalLetters = self.swCapitalLetters.isOn
            SecondViewController.useNumbers = self.swNumbers.isOn
            SecondViewController.useSpecialCharacters = self.swSpecialCharacters.isOn
            
            self.view.endEditing(true)
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func NextView(_ sender: Any) {
        var permission = true
        
        if let total = self.tfTotalPassword.text, let character = self.tfNumberOFCharacters.text{
            
            if Int(total) != nil{
                if Int(total)! < 4 {
                    permission = false
                    let alert = UIAlertController(title: "Parametro incorreto", message: "Mín quantidade senhas é 4", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                }
                
            }
            if Int(character) != nil {
                if Int(character)! > 16 {
                    permission = false
                    let alert = UIAlertController(title: "Parametro incorreto", message: "Máx de 16 caracterres por senha", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            if permission{
                performSegue(withIdentifier: "SecondViewSegue", sender: nil)
            }
            
        }
        
        
        
        
        
    }
}

// delegate para verificar a alteração de um text field logo após ser modificado.
extension ViewController: UITextFieldDelegate {
//    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
//        //  your code here
//    }
//
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        //  your code here
//    }
//
//    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
//        //  your code here
//    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("ok")
       
    }
}
