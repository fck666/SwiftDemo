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
        self.view.backgroundColor = UIColor.white
        let backButton = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y+150,width: 90,height: 50))
        self.view.addSubview(shadowRadiusView)
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
    lazy var shadowRadiusView : UIView = {
        let view = UIView(frame: CGRect(x: self.view.center.x-60, y: self.view.center.y + 120, width: 120, height: 120))
        view.backgroundColor = UIColor.orange
        view.layer.shadowColor = UIColor.green.cgColor;
        view.layer.borderColor = view.layer.shadowColor; // 边框颜色建议和阴影颜色一致
        view.layer.borderWidth = 0.000001; // 只要不为0就行
        view.layer.cornerRadius = 40;
        if #available(iOS 11.0, *) {
            view.layer.maskedCorners = [CACornerMask.layerMaxXMaxYCorner,  CACornerMask.layerMaxXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
        view.layer.shadowOpacity = 1;
        view.layer.shadowRadius = 20;
        view.layer.shadowOffset = CGSize(width: 0, height: 0);
        return view;
    }()
    lazy var checkImageView : UIImageView = {
        let img = UIImageView(frame: CGRect(x: self.view.center.x-90, y: self.view.center.y-90, width: 180, height: 180))
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 8
        img.layer.masksToBounds = true
        var a = arc4random_uniform(8)+1
        img.image = UIImage(named: String(a))
        img.isUserInteractionEnabled = true
        let singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
        let twiceTapGesture = UITapGestureRecognizer(target: self, action: #selector(twiceTap))
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(drag))
        twiceTapGesture.numberOfTapsRequired = 2
        twiceTapGesture.numberOfTouchesRequired = 1
        img.addGestureRecognizer(pinchGesture)
        img.addGestureRecognizer(singleTapGesture)
        img.addGestureRecognizer(longPressGesture)
        img.addGestureRecognizer(twiceTapGesture)
        img.addGestureRecognizer(panGesture)
        
        singleTapGesture.require(toFail: twiceTapGesture)
        return img
    }()
    @objc func singleTap(recognizer:UITapGestureRecognizer){
                        let newView = ThirdViewController()
                //        self.hidesBottomBarWhenPushed = true
                        newView.buttonIsHide = false
                        self.navigationController?.pushViewController(newView, animated: true)
                //        self.hidesBottomBarWhenPushed = false
                
    }
    //长按弹窗
    @objc func longPress(){
        
        let alertController = UIAlertController(title: "复制图片", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
        alertController.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    //双指放大缩小操作
    @objc func pinch(recognizer : UIPinchGestureRecognizer){
        self.view.bringSubviewToFront(checkImageView)
//        recognizer.view?.transform = (recognizer.view?.transform)!.scaledBy(x: recognizer.scale, y: recognizer.scale)
//        recognizer.scale = 1
//  transform会导致frame的改变
        recognizer.view?.bounds =
            CGRect(x: (recognizer.view?.bounds.origin.x)!, y: (recognizer.view?.bounds.origin.y)!, width: (recognizer.view?.bounds.size.width)! * recognizer.scale, height: (recognizer.view?.bounds.size.height)! * recognizer.scale)
        recognizer.scale = 1
    }
    //双击生成新的界面
    @objc func twiceTap(recognizer : UITapGestureRecognizer){
        recognizer.view?.frame = CGRect(x: self.view.center.x-90, y: self.view.center.y-90, width: 180, height: 180)
    }
    //拖动
    @objc func drag(recognizer : UIPanGestureRecognizer){
        self.view.bringSubviewToFront(checkImageView)
                let translation = recognizer.translation(in: self.view)
                checkImageView.center = CGPoint(x: checkImageView.center.x + translation.x, y: checkImageView.center.y + translation.y)
                recognizer.setTranslation(CGPoint.zero, in: self.view)
    }

    
}

