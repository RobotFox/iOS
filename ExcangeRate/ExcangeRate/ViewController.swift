//
//  ViewController.swift
//  ExcangeRate
//
//  Created by max on 04/05/2017.
//  Copyright © 2017 max. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var sourceCode:String?
    var destCode: String?
    
    @IBOutlet weak var pckOriginal: UIPickerView!
    @IBOutlet weak var pckDestination: UIPickerView!
    
    @IBOutlet weak var lblCambio: UILabel!
    @IBOutlet weak var txtImporto: UITextField!
    @IBOutlet weak var lblValuta: UILabel!
    
    enum Errors:Error {
        case notNumber
    }
    
    var currency:[(code: String, desc: String)] = [("USD","Dollaro Americano"), ("EUR","Euro"),("YEN","Yen")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pckOriginal.dataSource = self
        pckOriginal.delegate = self
        pckDestination.dataSource = self
        pckDestination.delegate = self
        txtImporto.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currency.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  currency[row].code
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // questo if serve a distinguere su quale picker view ho cliccato
        if pickerView == pckOriginal {
            sourceCode = currency[row].code
        } else if pickerView == pckDestination {
            destCode = currency[row].code
        }
        
        txtImporto.resignFirstResponder()
    }
    
    func getExcange(source: String, dest: String) -> Double {
        var ret :Double = 0
        
        if source == dest {
            ret = 1
        } else {
            ret = 1.1
        }
        
        return ret
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        txtImporto.becomeFirstResponder()
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtImporto.resignFirstResponder()
        return true
    }
    
    @IBAction func btnCalcolaValuta(_ sender: UIButton) {
        if sourceCode != nil && destCode != nil {
            var rapportoCambio = getExcange(source: sourceCode!, dest: destCode!)
            
            
            
            
            lblCambio.text = String(rapportoCambio)
            
            var valutaCalcolata = Double(txtImporto.text!)! * rapportoCambio
            
            lblValuta.text = String(valutaCalcolata)
            
        }
    }
    
    func convertStringToDouble(phrase:String) -> Double {
        var value = Double(phrase)
        
        return value!
    }
    
}

