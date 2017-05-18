//
//  ViewController.swift
//  iCalc
//
//  Created by Ospite on 02/05/17.
//  Copyright © 2017 Ospite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lblResult: UILabel!
    
    var cal = Calculator()
    
    var stackNumber:[Double] = []
    var stackOper:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCanc(_ sender: UIButton) {
        stackOper.removeAll()
        stackNumber.removeAll()
        lblResult.text = String(0.0)
    }
    
    @IBAction func btnDivide_TouchUpInside(_ sender: UIButton) {
        stackOper.append("/")
        lblResult.text = String(doMath(number: Double(lblResult.text!)!))
    }
    
    @IBAction func btnMolt_TouchUpInside(_ sender: UIButton) {
        stackOper.append("*")
        lblResult.text = String(doMath(number: Double(lblResult.text!)!))
    }

    @IBAction func btnMin_TouchUpInside(_ sender: UIButton) {
        stackOper.append("-")
        lblResult.text = String(doMath(number: Double(lblResult.text!)!))
    }

    @IBAction func btnAdd_TouchUpInside(_ sender: UIButton) {
        stackOper.append("+")
        lblResult.text = String(doMath(number: Double(lblResult.text!)!))
    }
    @IBAction func btnEqual_TouchUpInside(_ sender: UIButton) {
        var result:Double = 0.0
        switch stackOper.last! {
        case "+":
            result = cal.add(a: stackNumber.last!, b: Double(lblResult.text!)!)
        case "-":
            result = cal.sub(a: stackNumber.last!, b: Double(lblResult.text!)!)
        case "*":
            result = cal.molt(a: stackNumber.last!, b: Double(lblResult.text!)!)
        case "/":
            result = cal.div(a: stackNumber.last!, b: Double(lblResult.text!)!)
        default:
            result = 0.0
        }
        lblResult.text = String(result)
    }
    @IBAction func btnPoint_TouchUpInside(_ sender: UIButton) {
    }
    @IBAction func btnZero_TouchUpInside(_ sender: UIButton) {
        displayNumber(number: "0")
    }
    
    @IBAction func btnOne_TouchUpInside(_ sender: UIButton) {
        displayNumber(number: "1")
    }
    @IBAction func btnTwo_TouchUpInside(_ sender: UIButton) {
        displayNumber(number: "2")
    }
    @IBAction func btn3_TouchUpInside(_ sender: UIButton) {
        displayNumber(number: "3")
    }
    @IBAction func btn4_TouchUpInside(_ sender: UIButton) {
        displayNumber(number: "4")
    }
    @IBAction func btn5_TouchUpInside(_ sender: UIButton) {
        displayNumber(number: "5")
    }
    @IBAction func btn6_TouchUpInside(_ sender: UIButton) {
        displayNumber(number: "6")
    }
    @IBAction func btn7_TouchUpInside(_ sender: UIButton) {
        displayNumber(number: "7")
    }
    @IBAction func btn8_TouchUpInside(_ sender: UIButton) {
        displayNumber(number: "8")
    }
    @IBAction func btn9_TouchUpInside(_ sender: UIButton) {
        displayNumber(number: "9")
    }
    
    func displayNumber(number:String){
        if lblResult.text=="0.0" {
            lblResult.text = ""
            var stringValue = lblResult.text
            stringValue = stringValue!+number
            lblResult.text = stringValue
        }
        else{
            var stringValue = lblResult.text
            stringValue = stringValue!+number
            lblResult.text = stringValue
        }
    }
    func doMath(number:Double) -> Double {
        var result:Double = 0
        if stackNumber.isEmpty {
            stackNumber.append(number)
        }
        else{
            switch stackOper.last! {
            case "+":
                result = cal.add(a: stackNumber.last!, b: number)
            case "-":
                result = cal.sub(a: stackNumber.last!, b: number)
            case "*":
                result = cal.molt(a: stackNumber.last!, b: number)
            case "/":
                result = cal.div(a: stackNumber.last!, b: number)
            default:
                result = 0
            }
        }
        return result
    }
    
 //   func initUIButton(myButton:UIButton) {
//        //fare i bordi arrottondati
//        myButton.layer.cornerRadius=15
//        //accettare il click sulla figura del bottone
//        myButton.clipsToBounds=true
//        //utilizzo metodo definito sotto
//        myButton.applyGradient (colours: [UIColor.red, UIColor.white])
//        //definizione del colore secondario
//        myButton.tintColor=UIColor.red
//    }
    
//    extension UIView {
//        func applyGradient(colours: [UIColor]) -> Void {
//            self.applyGradient(colours: colours,location: nil)
//        }
//    }
    
//    @IBAction func touchUpInside(_ sender: Any) {
//        var myButton = sender as! UIButton
//        print(myButton.title(for: UIControlState.normal))
//    }
}

