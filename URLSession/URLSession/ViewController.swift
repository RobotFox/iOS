//
//  ViewController.swift
//  URLSession
//
//  Created by Ospite on 12/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        callMyWS()
        print("print: Call OK")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //chiamata GET verso un Web Services
    func callMyWS() {
        let myURL = URL(string: "http://api.fixer.io/latest")!
        
        var myRequest = URLRequest(url: myURL)
        
        myRequest.httpMethod = "POST"
        
        let session = URLSession.shared.dataTask(with: myURL){ (data, response, error) in
            
            if let myError = error {
                print("Errore in chiamata WS : \(error?.localizedDescription)")
            }
            else{
                let myResponse = (response as! HTTPURLResponse)
                
                if myResponse.statusCode == 200{
                    print(self.json_parseData(data!))
                }
                else{
                    print("Errore in Response : \(myResponse.description)")
                }
            }
            
        }
        session.resume()
        print("print: Fine chiamata")
    }
    
    //parsare un json
    func json_parseData( _ data: Data) -> NSDictionary?
    {
        do
        {
            let json: Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            
            return (json as? NSDictionary)
        }
        catch
        {
            print ("Errore: Json data not correct")
            return nil
        }
    }

}

