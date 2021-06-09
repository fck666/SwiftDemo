import UIKit
//@available(iOS 13.0, *)
//@available(iOS 14.0, *)
class NewViewController: UIViewController {
    var message : String?
    deinit {
        print("NewViewController deinit")
    }
    override func viewDidLoad() {
        
      
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        let button = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y-25,width: 90,height: 50))
        
        setupButt(button: button, title: "按下返回")
        let button1 = UIButton(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y-90,width: 90,height: 50))
        
        setupButt(button: button1, title: "按下跳转")
        button.addTarget(self, action: #selector(tapped), for: . touchUpInside)
        button1.addTarget(self, action: #selector(tapped1), for: .touchUpInside)
        self.view.addSubview(button)
        self.view.addSubview(button1)
        print(message ?? 6)
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
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }
    @objc func tapped1() {
        let vc = NewViewController()
        vc.message = "3"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
