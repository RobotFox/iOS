//
//  ViewController.swift
//  Primo
//
//  Created by Ospite on 28/04/17.
//  Copyright © 2017 Ospite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myCalc = Calcolatrice()
    
    @IBOutlet weak var lblStatus: UILabel!
    
    @IBOutlet weak var btnHello: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnHello_TouchUpInside(_ sender: UIButton) {
        lblStatus.text="Hello, World!"
        
    }
    
}

