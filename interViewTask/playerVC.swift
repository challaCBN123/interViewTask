//
//  playerVC.swift
//  interViewTask
//
//  Created by Bhargava on 19/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import AVKit
class playerVC: UIViewController {
    var player = AVPlayer()
    let keyWindow = UIApplication.shared.keyWindow
    
    @IBOutlet weak var videoView: UIView!
    var isVideoPlaying = true
    @IBOutlet weak var playbutton: UIButton!
    
    @IBOutlet weak var backWardBtn: UIButton!
    @IBOutlet weak var forwardBtn: UIButton!
    var dataDict = NSDictionary()
    @IBOutlet weak var titeLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        playbutton.setTitle("Pause", for: .normal)
        navigationController?.isNavigationBarHidden = true
        self.titeLbl.text = dataDict["title"] as? String
        getVideoUrl()
        navigationItem.hidesBackButton = true
    }
    func getVideoUrl(){
         let url = dataDict["url"] as! String
        if let videoUrl = URL(string: url){
         player = AVPlayer(url: videoUrl)
            let avPlayerLayer = AVPlayerLayer(player: player)
           // let wid = self.videoView.frame
       
            avPlayerLayer.frame =  CGRect(x:0 , y:0 , width: self.videoView.bounds.size.width, height: self.videoView.bounds.size.height)
            self.videoView.layer.addSublayer(avPlayerLayer)
            player.play()
        }
        
    }
    @IBAction func backAction(_ sender : UIButton){
        self.navigationController?.popViewController(animated: true)
    }
 
    @IBAction func didTapBackward(_ sender: UIButton) {
        let moveBackword: Float64 = 10
                   if player == nil
                   {
                       return
                   }
        let playerCurrenTime = CMTimeGetSeconds(player.currentTime())
                   var newTime = playerCurrenTime - moveBackword
                   if newTime < 0
                   {
                       newTime = 0
                   }
        player.pause()
                   let selectedTime: CMTime = CMTimeMake(value: Int64(newTime * 1000 as Float64), timescale: 1000)
        player.seek(to: selectedTime)
        print(playerCurrenTime,newTime)
        player.play()
    }
    
    @IBAction func didTapPlayBtn(_ sender: UIButton) {
        
            self.player.pause()
            self.playbutton.setTitle("Play", for: .normal)
       
    }
    
    @IBAction func didTapForward(_ sender: UIButton) {
        let moveForword : Float64 = 10

               if player == nil { return }
        if let duration  = player.currentItem?.duration {
            let playerCurrentTime = CMTimeGetSeconds(player.currentTime())
               let newTime = playerCurrentTime + moveForword
               if newTime < CMTimeGetSeconds(duration)
               {
                   let selectedTime: CMTime = CMTimeMake(value: Int64(newTime * 1000 as Float64), timescale: 1000)
                player.seek(to: selectedTime)
               }
            print(playerCurrentTime,newTime)
            //player.pause()
            player.play()
               }
    }
}
