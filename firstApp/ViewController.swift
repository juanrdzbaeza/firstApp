//
//  ViewController.swift
//  firstApp
//
//  Created by Juan Rodríguez Baeza on 19/9/17.
//  Copyright © 2017 Juan Rodríguez Baeza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: properties
    @IBOutlet weak var nombreLbl: UILabel!
    @IBOutlet weak var nombreTxt: UITextField!
    @IBOutlet weak var apellidoTxt: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nombreTxt.delegate      = self;
        apellidoTxt.delegate    = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func setResetBtn(sender: UIButton) {
        nombreLbl.text      = "Hola desconocido";
        nombreTxt.text      = "";
        apellidoTxt.text    = "";
    }
    
    func getRandomColor() -> UIColor {
        let randomR:CGFloat = CGFloat(drand48())
        let randomG:CGFloat = CGFloat(drand48())
        let randomB:CGFloat = CGFloat(drand48())
        return UIColor(red: randomR, green: randomG, blue: randomB, alpha: 1.0)
    }
    
    @IBAction func changeColour(sender: UIButton) {
        self.view.backgroundColor = getRandomColor()
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if nombreTxt.text != "" && apellidoTxt.text != ""{
            nombreLbl.text = "Hola "+nombreTxt.text!+" "+apellidoTxt.text!
        }else{
            nombreLbl.text = "Hola desconocido"
        }
    }
}

