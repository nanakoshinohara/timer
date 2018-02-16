//
//  ViewController.swift
//  timer
//
//  Created by 篠原七子 on 2018/02/16.
//  Copyright © 2018年 篠原七子. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer: Timer!
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateTimer(timer: Timer) {
        timer_sec += 0.1
        timerLabel.text = String(format: "%.1f", timer_sec)
    }
    
    @IBAction func start(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        self.timer_sec = 0
        self.timerLabel.text = String(format: "%.1f", self.timer_sec)
        if self.timer != nil {
            self.timer?.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
        }
    }
    
 


}

