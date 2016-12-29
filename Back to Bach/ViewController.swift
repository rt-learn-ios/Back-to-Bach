//
//  ViewController.swift
//  Back to Bach
//
//  Created by Royce on 03/10/2015.
//  Copyright © 2015 UPI Creations. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var scrub: UISlider!
    
    
    var player : AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioResource = Bundle.main.path(forResource: "bach", ofType: "mp3")!
        
        player = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioResource ))
        scrub.maximumValue = Float(player.duration)

        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrub), userInfo: nil, repeats: true)
    }
    
    
    func updateScrub() {
        scrub.value = Float(player.currentTime)
    }
    
    
    @IBAction func play(_ sender: AnyObject) {
        player.play()
    }
    
    @IBAction func pause(_ sender: AnyObject) {
        player.pause()
    }
    
    @IBAction func stop(_ sender: AnyObject) {
        player.stop()
    }
    
    @IBAction func adjustVolume(_ sender: UISlider) {
        player.volume = sender.value
    }
    
    @IBAction func scrub(_ sender: UISlider) {
        player.currentTime = TimeInterval(sender.value)
    }

}

