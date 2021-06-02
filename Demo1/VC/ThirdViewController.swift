//
//  ThirdViewController.swift
//  Demo1
//
//  Created by 58 on 2021/5/28.
//

import UIKit
class ThirdViewController: UIViewController {
    var buttonIsHide = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        let backButton = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y+150,width: 90,height: 50))
        setupButt(button: backButton, title: "返回root")
        backButton.isHidden = buttonIsHide
        backButton.addTarget(self, action: #selector(tapBackRoot), for: .touchUpInside)
        self.view.addSubview(checkImageView)
        self.view.addSubview(backButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupButt(button : UIButton , title : String){
        button.setTitle(title, for:.normal)
        button.setTitleColor(UIColor.black, for: .normal) //普通状态下文字的颜色
        button.setTitleColor(UIColor.green, for: .highlighted) //触摸状态下文字的颜色
        button.setTitleShadowColor(UIColor.green, for:.normal) //普通状态下文字阴影的颜色
        button.setTitleShadowColor(UIColor.yellow, for:.highlighted) //普通状态下文字阴影的颜色
        button.backgroundColor = UIColor.systemPink
    }
    
    @objc func tapBackRoot() {
//        self.tabBarController?.tabBar.isHidden = false
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popToRootViewController(animated: true)
        
//        let vc = NewViewController()
//        vc.message = "3"
//        self.navigationController?.pushViewController(vc, animated: true)
        }
    lazy var checkImageView : UIImageView = {
        let img = UIImageView(frame: CGRect(x: self.view.center.x-90, y: self.view.center.y-90, width: 180, height: 180))
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 5
        img.layer.masksToBounds = true
        var a = arc4random_uniform(8)+1
        img.image = UIImage(named: String(a))
        img.isUserInteractionEnabled = true
        let singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
        let twiceTapGesture = UITapGestureRecognizer(target: self, action: #selector(twiceTap))
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(drag))
        twiceTapGesture.numberOfTouchesRequired = 1
        twiceTapGesture.numberOfTapsRequired = 2
        img.addGestureRecognizer(pinchGesture)
        img.addGestureRecognizer(singleTapGesture)
        img.addGestureRecognizer(longPressGesture)
        img.addGestureRecognizer(twiceTapGesture)
        img.addGestureRecognizer(panGesture)
        return img
    }()
    @objc func singleTap(){
        let newView = ThirdViewController()
//        self.hidesBottomBarWhenPushed = true
        newView.buttonIsHide = false
        self.navigationController?.pushViewController(newView, animated: true)
//        self.hidesBottomBarWhenPushed = false
    }
    @objc func longPress(){
        
        let alertController = UIAlertController(title: "复制图片", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
        alertController.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    //双指放大缩小操作
    @objc func pinch(){
        
    }
    //双击恢复
    @objc func twiceTap(){
        checkImageView.frame(forAlignmentRect: CGRect(x: self.view.center.x-90, y: self.view.center.y-90, width: 180, height: 180))
    }
    //拖动
    @objc func drag(){

    }

    
}

