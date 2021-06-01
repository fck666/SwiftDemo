import UIKit
@available(iOS 13.0, *)
@available(iOS 14.0, *)
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
        label.textColor = UIColor.white
    }
    
    @objc func tapped() {
        self.dismiss(animated: true, completion: nil)
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
