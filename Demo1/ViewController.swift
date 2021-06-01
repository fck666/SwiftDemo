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
        tabBar.tintColor = UIColor.green
        
        addChildVC(childController: FirstViewController(), childTitle: "First", imageName: "01", selectedImageName: "1fill")
        addChildVC(childController: SecViewController(), childTitle: "Second", imageName: "02", selectedImageName: "2fill")
        addChildVC(childController: ThirdViewController(), childTitle: "Third", imageName: "03", selectedImageName: "3fill")
        // Do any additional setup after loading the view.
    }
    private func addChildVC(childController: UIViewController, childTitle: String, imageName: String,selectedImageName: String) {
        let navigation = UINavigationController(rootViewController: childController)
        navigation.navigationBar.barTintColor = childController.view.backgroundColor
        navigation.navigationBar.tintColor = UIColor.black
        navigation.navigationItem.leftBarButtonItem
        let dict = [NSAttributedString.Key.foregroundColor:UIColor.darkGray,NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)]
        navigation.navigationBar.titleTextAttributes = dict as? [String : AnyObject] as? [NSAttributedString.Key : Any]
        childController.title = childTitle
        
        
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        
        self.addChild(navigation)
    }

}

