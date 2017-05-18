//
//  ViewController.swift
//  tableViewExample
//
//  Created by Ospite on 10/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    let Province = ["Vicenza","Padova","Verona","Venezia"]
    
    @IBOutlet weak var lblProvincia: UILabel!
    @IBOutlet weak var tblProvinceTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tblProvinceTable.delegate = self
        tblProvinceTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Province.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = Province[indexPath.row]
        
        if (indexPath.row%2==0) {
            cell.textLabel?.textColor = UIColor.red
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lblProvincia.text = Province[indexPath.row]
    }


}

