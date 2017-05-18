//
//  ViewController.swift
//  MultiView
//
//  Created by Ospite on 10/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtTesto: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPagina1_TouchUp(_ sender: UIButton) {
        
        performSegue(withIdentifier: "SegueToPagina1", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueToPagina1" {
            let vc = segue.destination as! vc_Pagina1
            
            vc.myTitle = txtTesto.text!
        }
        
        
    }

}

