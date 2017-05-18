//
//  SecondViewController.swift
//  iSunshineOS
//
//  Created by Ospite on 12/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var txtLat: UITextField!
    
    @IBOutlet weak var txtLong: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtLat.delegate = self
        txtLong.delegate = self
        initTxt()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initTxt() {
        if let lat = defaults.string(forKey: "userLat"){
            txtLat.text = lat
        }
        if let long = defaults.string(forKey: "userLong") {
            txtLong.text = long
        }
    }


    @IBAction func btnSave_TouchUpInside(_ sender: UIButton) {
        defaults.set(self.txtLat.text, forKey: "userLat")
        defaults.set(self.txtLong.text, forKey: "userLong")
    }
}

