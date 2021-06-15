import UIKit
import SnapKit
//@available(iOS 13.0, *)
//@available(iOS 14.0, *)
class MesViewController: UIViewController, ConstraintRelatableTarget {
    var message : String?
    lazy var videoView : PlayerView = PlayerView()
    lazy var label = UILabel(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y-25,width: 90,height: 50))
    fileprivate lazy var playButton: UIButton = {
        let btn = UIButton.init(type: .system)
        btn.setImage(UIImage.init(named: "play_icon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.setImage(UIImage.init(named: "pause_icon")?.withRenderingMode(.alwaysOriginal), for: .selected)
        btn.tintColor = UIColor.clear
        return btn
    }()
    
    
    // - 事件处理
    /// 程序进入前台 开始活跃
    @objc func appBecomeActive() {
//        videoView.play()进入时自动会开始播放
        print("appBecomeActive")
    }
    /// 程序进入后台
    @objc func appEnterBackground() {
        print("appEnterBackground")
        UIApplication.shared.beginBackgroundTask(expirationHandler: {self.videoView.pause()})
    }
    /// 程序被杀死
    @objc func applicationWillTerminate() {
        print("app 被杀死")
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("信息页消失")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        videoView.backAction(self.navigationController, action: #selector(UINavigationController.popViewController(animated:)), for: .touchUpInside)
        self.view.backgroundColor = UIColor.purple
        setupLabel(label: label, title: message ?? "6")
        self.view.addSubview(videoView)
        self.addConstraints()
        //        self.navigationController?.navigationBar.isHidden = true
        //        self.view.addSubview(label)
        self.navigationController?.navigationBar.isTranslucent = false
        //        self.navigationController?.navigationBar.isHidden = true
        videoView.configure(url: URL.init(string: "https://devimages-cdn.apple.com/samplecode/avfoundationMedia/AVFoundationQueuePlayer_HLS2/master.m3u8")!, playImmediately: true)
        //  - 添加通知的监听
        NotificationCenter.default.addObserver(self, selector: #selector(appBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillTerminate), name: UIApplication.willTerminateNotification, object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    //    @objc func tapped() {
    //        self.dismiss(animated: true, completion: nil)
    //        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension MesViewController{
    func setupLabel(label : UILabel , title : String){
        label.highlightedTextColor = UIColor.blue
        label.backgroundColor = UIColor.black
        label.text = title
        label.textAlignment = .center
        label.textColor = UIColor.white
    }
    
    func addConstraints() {
        videoView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.height.equalTo(videoView.snp.width).dividedBy(16.0/9.0)
        }
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        videoView.viewWillTransition(to: size, with: coordinator)
        let portrait = size.width == min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        if portrait {
            print(1)
            videoView.snp.remakeConstraints({ (make) in
                make.top.left.right.equalTo(self.view)
                make.height.equalTo(videoView.snp.width).dividedBy(16.0/9.0)
            })
        }else{
            print(2)
            videoView.snp.remakeConstraints({ (make) in
                make.top.bottom.equalTo(self.view)
                make.left.equalToSuperview()
                make.right.equalToSuperview()
            })
        }
    }
}
