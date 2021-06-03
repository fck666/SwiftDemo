//
//  RowViewController.swift
//  Demo1
//
//  Created by 58 on 2021/6/2.
//

import Foundation
import UIKit
//@available(iOS 14.0, *)
class TableCell: UITableViewCell{
    static let identifierString = "TableViewCell"
    
    
    lazy var portraitImageView:UIImageView = {
        let image_View = UIImageView()
        image_View.contentMode = .scaleAspectFit
        image_View.frame = CGRect(x: 10, y: 20, width: 40, height: 40)
        image_View.layer.cornerRadius = 5
        image_View.layer.masksToBounds = true
        image_View.contentMode = .scaleAspectFill
        return image_View
    }()
    lazy var imageName : UILabel = {
        let titleLabel = UILabel()
        let height = contentView.frame.size.height
        titleLabel.frame = CGRect(x: portraitImageView.frame.maxX + 10, y: portraitImageView.frame.height/2, width: contentView.bounds.size.width - height - 10, height: height)
        return titleLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    public func config(text:String,image: Int){
        imageName.text = text
        portraitImageView.image = UIImage(named: String(image))
        imageName.backgroundColor = UIColor.white
        imageName.textColor = UIColor.blue
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension TableCell{
    func setUI() {
        selectionStyle = .none
        contentView.backgroundColor = .white
        contentView.addSubview(portraitImageView)
        contentView.addSubview(imageName)
        
    }
}
