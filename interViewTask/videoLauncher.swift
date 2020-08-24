//
//  videoLauncher.swift
//  interViewTask
//
//  Created by Bhargava on 23/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import AVKit
import Alamofire
class VideoPlayerView:UIView{
       let videoUrl = "commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
       // let player = AVPlayer()
//        if let url = URL(string: "commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"){
//            let player = AVPlayer(url: url)
//             let avPlayerLayer = AVPlayerLayer(player: player)
//
//            avPlayerLayer.frame = self.frame
//            self.layer.addSublayer(avPlayerLayer)
//            player.play()
//        }
            if let url = URL(string: "commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") {
              do {
                  let contents = try String(contentsOf: url)
                  print(contents)
              } catch {
                  // contents could not be loaded
              }
          } else {
              // the URL was bad!
          }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class videoLaunchers:NSObject{
    func showVideoPlayer(){
        print("Video Player")
        if let keyWindow = UIApplication.shared.keyWindow{
            let views = UIView(frame: keyWindow.frame)
            views.backgroundColor = UIColor.white
            views.frame = CGRect(x: keyWindow.frame.width-10, y: keyWindow.frame.height-10, width: 10, height: 10)
            // 16/9 is the aspect ratio of alla hd videos
            let height = keyWindow.frame.width * 9/16
            let videoPlayerFrame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: height)
            let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
            views.addSubview(videoPlayerView)
            keyWindow.addSubview(views)
            UIView.animate(withDuration: 0.5, delay: 0,usingSpringWithDamping: 1, initialSpringVelocity: 1 ,options: .curveEaseOut, animations: {
                views.frame = keyWindow.frame
            }) { (completedAnimaton) in
                UIApplication.shared.isStatusBarHidden = true
            }
        }
    }
}
