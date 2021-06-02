//
//  ThirdViewController.swift
//  Demo1
//
//  Created by 58 on 2021/5/28.
//

import UIKit
class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        checkImageView.image = UIImage(named: "1")
        self.view.addSubview(checkImageView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    lazy var checkImageView : UIImageView = {
        let img = UIImageView(frame: CGRect(x: self.view.center.x-90, y: self.view.center.y-90, width: 180, height: 180))
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 5
        img.layer.masksToBounds = true
        return img
    }()
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
