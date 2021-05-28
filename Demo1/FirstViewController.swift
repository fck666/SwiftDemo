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
        let button = UIButton(frame: CGRect(x: self.view.center.x-35,y: self.view.center.y-25,width: 70,height: 50))
        button.setTitle("按下", for:.normal)
        button.setTitleColor(UIColor.black, for: .normal) //普通状态下文字的颜色
        button.setTitleColor(UIColor.green, for: .highlighted) //触摸状态下文字的颜色
        button.setTitleShadowColor(UIColor.green, for:.normal) //普通状态下文字阴影的颜色
        button.setTitleShadowColor(UIColor.yellow, for:.highlighted) //普通状态下文字阴影的颜色
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(tapped), for: .touchDown)
        self.view.addSubview(button)
        // Do any additional setup after loading the view.
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
