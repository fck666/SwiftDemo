import UIKit
//@available(iOS 13.0, *)
//@available(iOS 14.0, *)
class NewViewController: UIViewController {
    var message : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        let button = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y-25,width: 90,height: 50))
       
        setupButt(button: button, title: "按下跳转")
        
        button.addTarget(self, action: #selector(tapped), for: . touchUpInside)
       
        self.view.addSubview(button)
        print(message!)
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
    
    @objc func tapped() {
//        self.tabBarController?.tabBar.isHidden = false
//        self.dismiss(animated: true, completion: nil)
//        self.navigationController?.popViewController(animated: true)
        
        let vc = NewViewController()
        vc.message = "3"
        self.navigationController?.pushViewController(vc, animated: true)
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
