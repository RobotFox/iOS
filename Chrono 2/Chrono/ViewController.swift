//
//  ViewController.swift
//  Chrono
//
//  Created by Ospite on 05/05/17.
//  Copyright © 2017 Sam. All rights reserved.
//

import UIKit
import GaugeKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gaugeHour: Gauge!
    
    @IBOutlet weak var gaugeMinute: Gauge!
    
    @IBOutlet weak var gaugeSecond: Gauge!
    
    @IBOutlet weak var btnPlay: UIButton!
    
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var lblTimeLap: UILabel!
    
    var timerRunning:Bool = false
    
    var timer = Timer()
    
    var second = 0
    
    var dateTime:Date?
    
    var pauseTapped = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       btnPlay.layer.borderWidth=2
        btnPlay.layer.cornerRadius=50
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnPlay_TouchUpInside(_ sender: UIButton) {
        
        let btnPlay_ON:UIImage = UIImage(named: "PlayI")!
        let btnPause_ON:UIImage = UIImage(named: "Pause")!
        if timerRunning {
            btnPlay.setImage(btnPause_ON, for:UIControlState.normal)
            timerRunning = false
            runTimer()
        }
        else{
            btnPlay.setImage(btnPlay_ON, for: UIControlState.normal)
            timerRunning=true
        }
    }
    
    @IBAction func btnStop_TouchUpInside(_ sender: UIButton) {
    }
    
    @IBAction func btnClear_TouchUpInside(_ sender: UIButton) {
    }

    @IBAction func btnLap_TouchUpInside(_ sender: UIButton) {
    }
    
    func  runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(refreshDate), userInfo: nil, repeats: true)
    }
    
    func updateLabel(){
        second+=1
        lblTime.text="\(second)"
    }
    
    func refreshDate(){
        dateTime = Date()
        let calendar = Calendar.current
        
        let hours = calendar.component(.hour, from: dateTime!)
        let minutes = calendar.component(.minute, from: dateTime!)
        let seconds = calendar.component(.second, from: dateTime!)
        
        var stringLabel = String(format: "%02d:%02d:%02d", hours,minutes,seconds)
        gaugeHour.rate = CGFloat(hours)
        gaugeMinute.rate = CGFloat(minutes)
        gaugeSecond.rate = CGFloat(seconds)
        lblTime.text = stringLabel
    }

}

