//
//  vc_Detail.swift
//  TableSecondView
//
//  Created by Ospite on 10/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import Foundation
import UIKit

class vc_Detail: UIViewController {
    
    var detail:String = ""
    
    
    @IBOutlet weak var lblDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblDetail.text = detail
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
