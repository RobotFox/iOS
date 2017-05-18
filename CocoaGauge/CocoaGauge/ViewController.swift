//
//  ViewController.swift
//  CocoaGauge
//
//  Created by Ospite on 09/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit
import GaugeKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var gaubeProgress: Gauge!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gaubeProgress.maxValue = 100
        gaubeProgress.rate = 0.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnProgress_TouchUpInside(_ sender: UIButton) {
        gaubeProgress.rate+=10
    }

    @IBAction func btnDescent_TouchUpInside(_ sender: UIButton) {
        if gaubeProgress.rate>0.0 {
            gaubeProgress.rate-=1
        }
        
    }
}

