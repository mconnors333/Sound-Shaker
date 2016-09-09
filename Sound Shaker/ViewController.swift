//
//  ViewController.swift
//  Sound Shaker
//
//  Created by Matthew Connors on 9/9/16.
//  Copyright © 2016 Matt Connors. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.motionShake {
            
            let soundArray = ["click", "crackers", "disappear", "drag", "gun", "match", "static", "zap"]
            
            let randomNumber = Int(arc4random_uniform(UInt32(soundArray.count)))
            
            let fileLocation = Bundle.main.path(forResource: soundArray[randomNumber], ofType: "mp3", inDirectory: "Sounds")
            
            do {
                
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileLocation!))
                
                player.play()
                
            } catch {
                
                // Process any errors
                
                
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

