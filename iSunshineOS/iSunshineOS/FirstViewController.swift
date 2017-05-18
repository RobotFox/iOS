//
//  FirstViewController.swift
//  iSunshineOS
//
//  Created by Ospite on 12/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    var latitude:Double = 0.0
    
    var longitude:Double = 0.0
    
    @IBOutlet weak var lblCity: UILabel!
    
    @IBOutlet weak var lblDateWeather: UILabel!
    
    @IBOutlet weak var lblTempCurrent: UILabel!
    
    @IBOutlet weak var lblTempMin: UILabel!
    
    @IBOutlet weak var lblTempMax: UILabel!
    
    @IBOutlet weak var lblSituation: UILabel!
    
    @IBOutlet weak var imgWeather: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initParams()
        
        callMyWS(lat: latitude, long: longitude)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //codice da inserire qui. Questo metodo viene chiamato ogni volta che viene visualizzata la view
        initParams()
        callMyWS(lat: latitude, long: longitude)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //chiamata GET verso un Web Services
    func callMyWS(lat:Double,long:Double) {
        let myURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&units=metric&appid=0a572e0065bd59f1b15f7e8ca0f2fdb3")!

        
        let session = URLSession.shared.dataTask(with: myURL){ (data, response, error) in
            
            if let myError = error {
                print("Errore in chiamata WS : \(error?.localizedDescription)")
            }
            else{
                let myResponse = (response as! HTTPURLResponse)
                
                if myResponse.statusCode == 200{
                    print(self.json_parseData(data!))
                    var jsonPop = self.json_parseData(data!)
                    self.populateLbl(data: jsonPop!)
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
    
    func populateLbl(data:NSDictionary) {
        
        if let tempInfo = data["main"] as? [String : Any] {
            
            let tempMax:Double = tempInfo["temp_max"] as! Double
            let tempMin:Double = tempInfo["temp_min"] as! Double
            let tempCurrent:Double = tempInfo["temp"] as! Double
            
            lblTempMax.text = String(tempMax)
            lblTempMin.text = String(tempMin)
            lblTempCurrent.text = String(tempCurrent)
        }
        
        if let cityInfo = data["name"] as? String{
            lblCity.text = cityInfo
            var dataWeather = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MM yyyy"
            let newDate = dateFormatter.string(from: dataWeather)
            lblDateWeather.text = newDate
        }
        if let weatherInfo = data["weather"] as? [[String : Any]]{
            var desc:String = ""
            
            for tag in weatherInfo{
                desc = tag["description"] as! String
                switch tag["main"] as! String {
                case "Clouds":
                    imgWeather.image = #imageLiteral(resourceName: "clouds.jpeg")
                    break
                case "Clear":
                    imgWeather.image = #imageLiteral(resourceName: "sereno.jpg")
                    break
                default:
                    print("Any")
                }
            }
            lblSituation.text = desc
        }
    }
    
    
    func initParams() {
        if let lat = defaults.string(forKey: "userLat"){
            latitude = Double(lat)!
        }
        if let long = defaults.string(forKey: "userLong") {
            longitude = Double(long)!
        }
    }


}

