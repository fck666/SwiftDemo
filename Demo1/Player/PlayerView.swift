//
//  PlayerView.swift
//  Demo1
//
//  Created by 58 on 2021/6/11.
//
import UIKit
import AVFoundation


// MARK: - Player 定义
class PlayerView: UIView {
    fileprivate lazy var player = AVPlayer.init()
    fileprivate lazy var playerLayer: AVPlayerLayer = {
        let layer = AVPlayerLayer.init(player: self.player)
        layer.videoGravity = AVLayerVideoGravity.resizeAspect
        layer.contentsScale = UIScreen.main.scale
        return layer
    }()
    fileprivate lazy var bottomBar = BottomBarView.init(frame: CGRect.zero)
    fileprivate lazy var topBar = TopBarView.init(frame: CGRect.zero)
    fileprivate lazy var playButton: UIButton = {
        let btn = UIButton.init(type: .system)
        btn.setImage(UIImage.init(named: "play_icon")?.withRenderingMode(.alwaysOriginal), for: .selected)
        btn.setImage(UIImage.init(named: "pause_icon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.tintColor = UIColor.clear
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.addSublayer(playerLayer)
        self.addSubviews()
        self.addConstraints()
        self.addEvents()
        self.isUserInteractionEnabled = true
        let singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        self.addGestureRecognizer(singleTapGesture)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func singleTap(recognizer:UITapGestureRecognizer){
        if self.bottomBar.isHidden == true{
            self.bottomBar.isHidden = false
            self.playButton.isHidden = false
            self.topBar.isHidden = false
        }else{
            self.bottomBar.isHidden = true
            self.topBar.isHidden = true
            self.playButton.isHidden = true
        }
                
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = self.bounds
        playerLayer.backgroundColor = UIColor.black.cgColor
    }
}


// MARK: - 对外提供接口
extension PlayerView {
    func configure(url: URL, playImmediately: Bool) {
        player.replaceCurrentItem(with: AVPlayerItem.init(url: url))
        if playImmediately {
            player.play()
        }
    }
    func addEvents() {
        playButton.addTarget(self, action: #selector(playButtonClicked(_:)), for: .touchUpInside)
        bottomBar.orientationButton.addTarget(self, action: #selector(orientationButtonClicked(_:)), for: .touchUpInside)
    }
    func play() {
        if playButton.isSelected {
            return
        }
        print("播放")
        self.playButtonClicked(playButton)
    }
    func pause() {
        if !playButton.isSelected {
            return
        }
        print("暂停")
        self.playButtonClicked(playButton)
    }
    func adjustUI() {
        //横纵屏
        bottomBar.orientationButton.isSelected = !(UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height)
    }
    func addSubviews() {
        self.addSubview(bottomBar)
        self.addSubview(topBar)
        self.addSubview(playButton)
    }
    func addConstraints() {
        bottomBar.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(0)
            make.height.equalTo(44)
        }
        topBar.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.height.equalTo(44)
        }
        playButton.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.size.equalTo(playButton.currentImage!.size)
        }
    }
    func backAction(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        topBar.backButton.addTarget(target, action: action, for: controlEvents)
    }
    @objc fileprivate func playButtonClicked(_ sender: UIButton) {
        let playing = sender.isSelected
        print(playing)
        sender.isSelected = !sender.isSelected
        if playing {//正在播放
            player.play()
//            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
////                self.contentOverlayView.alpha = 1
//            }, completion: nil)
        }else {
            player.pause()
            DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                if self.playButton.isSelected{
//                    UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
////                        self.contentOverlayView.alpha = 0
//                    }, completion: nil)
                }
            })
        }
        
    }
    @objc func orientationButtonClicked(_ sender: UIButton) {
        print("666")
        if sender.isSelected {//需要退出全屏
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }else{//需要全屏
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        }
    }
    func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let portrait = size.width == min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        bottomBar.orientationButton.isSelected = !portrait
    }
}

