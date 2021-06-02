//
//  FirstViewController.swift
//  Demo1
//
//  Created by 58 on 2021/5/28.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        let changeColorButton = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y-25,width: 90,height: 50))
        let presentViewButton = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y+60,width: 90,height: 50))
        let pushViewButton = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y-110,width: 90,height: 50))
        changeColorButton.layer.cornerRadius = 10
        setupButton(button: changeColorButton, title: "按下变色")
        setupButton(button: presentViewButton, title: "按下跳转")
        setupButton(button: pushViewButton, title: "按下跳转")
        changeColorButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        presentViewButton.addTarget(self, action: #selector(tapped1), for: .touchUpInside)
        pushViewButton.addTarget(self, action: #selector(tapped2), for: .touchUpInside)
        self.view.addSubview(changeColorButton)
        self.view.addSubview(presentViewButton)
        self.view.addSubview(pushViewButton)
        // Do any additional setup after loading the view.
    }
    func setupButton(button : UIButton , title : String){
        button.setTitle(title, for:.normal)
        button.setTitleColor(UIColor.black, for: .normal) //普通状态下文字的颜色
        button.setTitleColor(UIColor.green, for: .highlighted) //触摸状态下文字的颜色
        button.setTitleShadowColor(UIColor.green, for:.normal) //普通状态下文字阴影的颜色
        button.setTitleShadowColor(UIColor.yellow, for:.highlighted) //普通状态下文字阴影的颜色
        button.backgroundColor = UIColor.white
    }
    @objc func tapped1(){
        let des = NewViewController()
        des.message = "传递的信息"
        self.present(des, animated: true, completion: nil)
    }
    @objc func tapped2(){
        
        let des = NewViewController()
        des.message = "传递的信息"
//        self.tabBarController?.tabBar.isHidden = true
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(des, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    @objc func tapped() {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
