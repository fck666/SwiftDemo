import UIKit
//@available(iOS 13.0, *)
//@available(iOS 14.0, *)
class MesViewController: UIViewController {
    var message : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        let label = UILabel(frame: CGRect(x: self.view.center.x-45,y: self.view.center.y-25,width: 90,height: 50))
        
        setupLabel(label: label, title: message ?? "6")
        
        
        
        self.view.addSubview(label)
        //        print(message!)
        // Do any additional setup after loading the view.
    }
    func setupLabel(label : UILabel , title : String){
        label.highlightedTextColor = UIColor.blue
        label.backgroundColor = UIColor.black
        label.text = title
        label.textAlignment = .center
        label.textColor = UIColor.white
    }
    
    //    @objc func tapped() {
    //        self.dismiss(animated: true, completion: nil)
    //        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
