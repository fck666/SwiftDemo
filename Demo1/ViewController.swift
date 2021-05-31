//
//  ViewController.swift
//  Demo1
//
//  Created by 58 on 2021/5/28.
//

import UIKit

@available(iOS 14.0, *)
class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = UIColor.green
        
        addChildVC(childController: FirstViewController(), childTitle: "First", imageName: "tabbar_1", selectedImageName: "tabbar_selected_1")
        addChildVC(childController: SecViewController(), childTitle: "Second", imageName: "tabbar_2", selectedImageName: "tabbar_selected_3")
        addChildVC(childController: ThirdViewController(), childTitle: "Third", imageName: "tabbar_3", selectedImageName: "tabbar_selected_3")
        // Do any additional setup after loading the view.
    }
    private func addChildVC(childController: UIViewController, childTitle: String, imageName: String,selectedImageName: String) {
        let navigation = UINavigationController(rootViewController: childController)
        navigation.navigationBar.barTintColor = childController.view.backgroundColor
        navigation.navigationBar.tintColor = UIColor.black
        let dict = [NSAttributedString.Key.foregroundColor:UIColor.darkGray,NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)]
        navigation.navigationBar.titleTextAttributes = dict as? [String : AnyObject] as? [NSAttributedString.Key : Any]
        childController.title = childTitle
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        self.addChild(navigation)
    }

}

