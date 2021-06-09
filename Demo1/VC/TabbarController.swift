//
//  ViewController.swift
//  Demo1
//
//  Created by 58 on 2021/5/28.
//

import UIKit

//@available(iOS 14.0, *)
class TabbarController: UITabBarController{
    var lastDate = NSDate()
    
    var refreshDelegate: TabbarRefreshDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = UIColor.white
        self.delegate = self
        let nav1 = addChildVC(childController: FirstViewController(), childTitle: "First", imageName: "01", selectedImageName: "1fill")
        let secVC = SecViewController()
        refreshDelegate = secVC
        let nav2 = addChildVC(childController: secVC, childTitle: "Second", imageName: "02", selectedImageName: "2fill")
        let nav3 = addChildVC(childController: ThirdViewController(), childTitle: "Third", imageName: "03", selectedImageName: "3fill")
        let nav4 = addChildVC(childController: FourthViewController(), childTitle: "Fourth", imageName: "04", selectedImageName: "4fill")
        self.viewControllers = [nav1,nav2,nav3,nav4]
    }
    private func addChildVC(childController: UIViewController, childTitle: String, imageName: String,selectedImageName: String) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: childController)
        navigation.navigationBar.barTintColor = childController.view.backgroundColor
        navigation.navigationBar.tintColor = UIColor.black
        let dict = [NSAttributedString.Key.foregroundColor:UIColor.darkGray,NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)]
        navigation.navigationBar.titleTextAttributes = dict as? [String : AnyObject] as? [NSAttributedString.Key : Any]
        childController.title = childTitle
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        //设置图片在tarbar中的位置
        childController.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
        //        self.addChild(navigation)
        return navigation
    }
    
}
protocol TabbarRefreshDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
    func refresh()
    
}
extension TabbarController: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let vc = tabBarController.selectedViewController
        let date = NSDate()
        if vc == viewController&&tabBarController.selectedIndex == 1{
            if date.timeIntervalSince1970 - lastDate.timeIntervalSince1970 <= 0.5{
//                let vc = (viewController as! UINavigationController).viewControllers.first
//                (vc as! SecViewController).table.mj_header?.beginRefreshing()
                print("666")
                
                if let refreshDelegate = refreshDelegate {
                    refreshDelegate.refresh()
                }
                
                lastDate = NSDate(timeIntervalSinceReferenceDate:1000)
            }else{
                lastDate = date
            }
        }
        else {
            lastDate = date
        }
    }
}
