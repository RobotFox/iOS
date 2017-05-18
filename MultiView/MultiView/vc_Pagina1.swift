//
//  vc_Pagina1.swift
//  MultiView
//
//  Created by Ospite on 10/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit
import Foundation

class vc_Pagina1: UIViewController {
    
    var myTitle:String = ""
    
    @IBOutlet weak var lblTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = myTitle
    }
    
    override func didReceiveMemoryWarning() {
    }
    
    
}
