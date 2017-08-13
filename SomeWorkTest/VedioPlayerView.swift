//
//  VedioPlayerView.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 5/11/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class VedioPlayerView: UIViewController ,AVAudioPlayerDelegate{
    
    @IBOutlet weak var menuButton: UIBarButtonItem!

    
    @IBOutlet weak var playVideoButton: UIButton!
    
    
    
    @IBOutlet weak var playAudio: UIButton!
    
    
    
    
    
    
    @IBOutlet weak var playButton: UIButtonExtender!
    
    
    @IBOutlet weak var progressShow: UIProgressView!
    
    
    
    
    
    
    var audioPlayer: AVAudioPlayer?

    
    var audioPlaying : Bool! = false
    
    
    var tempTimer : Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        playVideoButton.addTarget(self, action: "playVideo:", for: .touchUpInside)
        
        //playAudio
         playAudio.addTarget(self, action: "playAudio:", for: .touchUpInside)
        
        
        
        
        playButton.addTarget(self, action: "playingAudio:", for: .touchUpInside)
    }

 

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        
        menuButton.action = nil
        if self.revealViewController() != nil {
            
            if (UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray)[0] as! String == "en"{
                menuButton.action = "revealToggle:"
                self.revealViewController().rightViewRevealWidth = 0
                print("language english ")
                
            }else if (UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray)[0] as! String == "ar"{
                
                //                print("language is arabic")
                self.revealViewController().rightViewRevealWidth = self.view.frame.size.width/3 * 2
                self.revealViewController().rearViewRevealWidth = 0
                menuButton.action =   "rightRevealToggle:"
                
                
            }
            
            
            
            menuButton.target = self.revealViewController()
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        
    }
    
    
    
    
    func playVideo(_ sender : UIButton){
        // "http://avikam.com/wp-content/uploads/2016/09/SpeechRecognitionTutorial.mp4"
        
        let player = AVPlayer(url: URL(string: "http://avikam.com/wp-content/uploads/2016/09/SpeechRecognitionTutorial.mp4")!)
        let playerController = AVPlayerViewController()
    
        
        playerController.player = player
        
        self.present(playerController, animated: true) {
            player.play()
        }
    
    }
    
    
    
    
    
    
    func playingAudio(_ sender : UIButton)  {
        
        if audioPlaying == false  && audioPlayer == nil {
            
            audioPlaying = true
            playButton.setImage(UIImage.init(named: "pause"), for: .normal)
            

            
            progressShow.progress = 0.0

        let url = URL.init(fileURLWithPath: Bundle.main.path(
            forResource: "music2",
            ofType: "mp3")!)
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            
            audioPlayer?.volume = 0.1
            
            //print( audioPlayer?.duration)
            
            
            tempTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateSliderProgress), userInfo: nil, repeats: true)
            
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch let error as NSError {
            print("audioPlayer error \(error.localizedDescription)")
        }
        
        
        }
        else if audioPlaying == false {
            audioPlaying = true

            playButton.setImage(UIImage.init(named: "pause"), for: .normal)
            tempTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateSliderProgress), userInfo: nil, repeats: true)
            
            audioPlayer?.play()

        
        
        }
            
        else{
        
            playButton.setImage(UIImage.init(named: "play"), for: .normal)
          
            audioPlayer?.pause()
            
            tempTimer.invalidate()
            audioPlaying = false

        
        }
        
        
        
    }
    
    
    
    
        
        func playAudio(_ sender : UIButton){

            


            
            let url = URL.init(fileURLWithPath: Bundle.main.path(
                forResource: "music2",
                ofType: "mp3")!)

            do {
                try audioPlayer = AVAudioPlayer(contentsOf: url)
                audioPlayer?.delegate = self
                
                audioPlayer?.volume = 10.2
                
               print( audioPlayer?.duration)

                
                _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateSliderProgress), userInfo: nil, repeats: true)

                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch let error as NSError {
                print("audioPlayer error \(error.localizedDescription)")
            }
            
            

            
            

    
    
}
    func updateSliderProgress(){
        
        
        var tempCurrentPostion = (((audioPlayer?.currentTime)!  ) /  (audioPlayer?.duration)! )
        progressShow.progress = Float.init(tempCurrentPostion)

        
        
        print(tempCurrentPostion)
       // print(audioPlayer?.currentTime)
        //var progress = player.currentTime / player.duration
        //timeSlider.setValue(Float(progress), animated: false)
    }
            
            
    
    
    
    
   
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully
        flag: Bool) {
        
        
        
        
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer,
                                        error: Error?) {
    }
    
    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
    }
    
    func audioPlayerEndInterruption(player: AVAudioPlayer) {
        
    }
}
