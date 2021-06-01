//
//  FirstViewController.swift
//  Demo1
//
//  Created by 58 on 2021/5/28.
//

import UIKit
@available(iOS 13.0, *)
@available(iOS 14.0, *)
class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        let button = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y-25,width: 90,height: 50))
        let button1 = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y+60,width: 90,height: 50))
        let button2 = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y-110,width: 90,height: 50))
        setupButt(button: button, title: "按下变色")
        setupButt(button: button1, title: "按下跳转")
        setupButt(button: button2, title: "按下跳转")
        button.addTarget(self, action: #selector(tapped), for: .touchDown)
        button1.addTarget(self, action: #selector(tapped1), for: .touchDown)
        button2.addTarget(self, action: #selector(tapped2), for: .touchDown)
        self.view.addSubview(button)
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        // Do any additional setup after loading the view.
    }
    func setupButt(button : UIButton , title : String){
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
        self.navigationController?.pushViewController(des, animated: true)
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
