//
//  FirstViewController.swift
//  Demo1
//
//  Created by 58 on 2021/5/28.
//

import UIKit
import SnapKit
class FirstViewController: UIViewController {
    deinit {
        print("第一页消失")
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        changeColorButton.layer.cornerRadius = 10
        setupButton(button: changeColorButton, title: "按下变色")
        setupButton(button: presentViewButton, title: "按下跳转")
        setupButton(button: pushViewButton, title: "按下跳转")
        setupButton(button: antimateViewButton, title: "动画效果")
        setupButton(button: notificationViewButton, title: "按下通知")
        changeColorButton.addTarget(self, action: #selector(tapChangeColor), for: .touchUpInside)
        presentViewButton.addTarget(self, action: #selector(tapPresent), for: .touchUpInside)
        pushViewButton.addTarget(self, action: #selector(tapPush), for: .touchUpInside)
        antimateViewButton.addTarget(self, action: #selector(tapAntimate), for: .touchUpInside)
        notificationViewButton.addTarget(self, action: #selector(tapNotification), for: .touchUpInside)
        self.view.addSubview(changeColorButton)
        self.view.addSubview(presentViewButton)
        self.view.addSubview(pushViewButton)
        self.view.addSubview(antimateViewButton)
        self.view.addSubview(notificationViewButton)
        NotificationCenter.default.addObserver(self, selector: #selector(notificate(notifi:)), name: NSNotification.Name(rawValue: "notification"), object:nil)
    }
    func setupButton(button : UIButton , title : String){
        button.setTitle(title, for:.normal)
        button.setTitleColor(UIColor.black, for: .normal) //普通状态下文字的颜色
        button.setTitleColor(UIColor.green, for: .highlighted) //触摸状态下文字的颜色
        button.setTitleShadowColor(UIColor.green, for:.normal) //普通状态下文字阴影的颜色
        button.setTitleShadowColor(UIColor.yellow, for:.highlighted) //普通状态下文字阴影的颜色
        button.backgroundColor = UIColor.white
    }
    lazy var pushViewButton : UIButton = {
        let pushButton = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y-110,width: 90,height: 50))
        return pushButton
    }()
    lazy var presentViewButton : UIButton = {
        let presentButton = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y+60,width: 90,height: 50))
        return presentButton
    }()
    lazy var changeColorButton :UIButton = {
        let changeColorButton = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y-25,width: 90,height: 50))
        return changeColorButton
    }()
    lazy var antimateViewButton : UIButton = {
        let antimateButton = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y+145,width: 90,height: 50))
        return antimateButton
    }()
    lazy var notificationViewButton : UIButton = {
        let notificationButton = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y-195,width: 90,height: 50))
        return notificationButton
    }()
    @objc func notificate(notifi: Notification){
        let num = notifi.userInfo!["info"]!
        self.notificationViewButton.setTitle("通知：\(num)", for: .normal)
    }
    @objc func tapPresent(){
        let des = NewViewController()
        des.message = "传递的信息"
        des.modalPresentationStyle = .fullScreen
        self.present(des, animated: true, completion: nil)
    }
    @objc func tapNotification(){
        let des = NewViewController()
        des.message = "传递的信息"
        des.modalPresentationStyle = .overFullScreen
        self.present(des, animated: true, completion: nil)
    }
    @objc func tapPush(){
        let des = NewViewController()
        des.message = "传递的信息"
        des.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(des, animated: true)
    }
    @objc func tapChangeColor() {
        if self.view.backgroundColor == UIColor.red{
            self.view.backgroundColor = UIColor.black
        }
        else{
            self.view.backgroundColor = UIColor.red
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //添加按钮的动画效果
    @objc func tapAntimate(){
        UIView.animate(withDuration: 2, animations: {
            self.changeColorButton.alpha = 0
            self.pushViewButton.alpha = 0
            self.presentViewButton.alpha = 0
            self.notificationViewButton.alpha = 0
            self.antimateViewButton.center = self.view.center
            self.view.backgroundColor = UIColor.white
        }, completion: {
            (finished) in
            UIView.animate(withDuration: 2, animations: {
                self.changeColorButton.alpha = 1
                self.pushViewButton.alpha = 1
                self.presentViewButton.alpha = 1
                self.notificationViewButton.alpha = 1
                self.antimateViewButton.center = CGPoint(x: self.presentViewButton.center.x, y: self.presentViewButton.center.y+85)
                self.view.backgroundColor = UIColor.red
            })
        })}
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
