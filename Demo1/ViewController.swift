//
//  ViewController.swift
//  Demo1
//
//  Created by 58 on 2021/5/28.
//

import UIKit

//@available(iOS 14.0, *)
class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = UIColor.white
//        tabBar.tintColor = UIColor.green
        
       let nav1 = addChildVC(childController: FirstViewController(), childTitle: "First", imageName: "01", selectedImageName: "1fill")
        let nav2 = addChildVC(childController: SecViewController(), childTitle: "Second", imageName: "02", selectedImageName: "2fill")
        let nav3 = addChildVC(childController: ThirdViewController(), childTitle: "Third", imageName: "03", selectedImageName: "3fill")
        
        self.viewControllers = [nav1,nav2,nav3]
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
        childController.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 3, bottom: 3, right: 3)
//        self.addChild(navigation)
        return navigation
    }

}

