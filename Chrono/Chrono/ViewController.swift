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
    
    var minute = 0
    
    var hour = 0
    
    var dateTime:Date?
    
    var pauseTapped = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       btnPlay.layer.borderWidth=2
        btnPlay.layer.cornerRadius=50
        gaugeSecond.rate=0.0
        gaugeMinute.rate=0.0
        gaugeHour.rate=0.0
        gaugeSecond.maxValue=60
        gaugeMinute.maxValue=60
        gaugeHour.maxValue=60
        
        
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
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
    }
    
    func updateLabel(){
        second+=1
        if second>59 {
            minute+=1
            second=0
        }
        if minute>59 {
            minute=0
            hour+=1
        }
        var stringTime = String(format:"%02d:%02d:%02d",hour,minute,second)
        gaugeHour.rate = CGFloat(hour)
        gaugeMinute.rate = CGFloat(minute)
        gaugeSecond.rate = CGFloat(second)
        
        lblTime.text = stringTime
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

