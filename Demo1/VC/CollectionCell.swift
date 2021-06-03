//
//  CollectionCell.swift
//  Demo1
//
//  Created by 58 on 2021/6/3.
//

import UIKit
class CollectionCell : UICollectionViewCell {
    static let identifierString = "CollectionCell"
    
    
    lazy var collectionImageView:UIImageView = {
        let image_View = UIImageView()
        image_View.contentMode = .scaleAspectFit
        image_View.frame = CGRect(x: 10, y: 3, width: 40, height: 40)
        image_View.layer.cornerRadius = 5
        image_View.layer.masksToBounds = true
        image_View.contentMode = .scaleAspectFill
        return image_View
    }()
    lazy var tableCellName : UILabel = {
        let titleLabel = UILabel()
        let height = contentView.frame.size.height
        titleLabel.frame = CGRect(x: collectionImageView.frame.midX-10, y: collectionImageView.frame.height+5, width: 20, height: 30)
        return titleLabel
    }()
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 60, height: 80))
        setCollectionCell()
        
    }
    
    public func config(text:String,image: Int){
        tableCellName.text = text
        collectionImageView.image = UIImage(named: String(image))
        tableCellName.backgroundColor = UIColor.white
        tableCellName.textColor = UIColor.blue
        tableCellName.font = UIFont.systemFont(ofSize: 10)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension CollectionCell{
    func setCollectionCell() {
        contentView.backgroundColor = .white
        contentView.addSubview(collectionImageView)
        contentView.addSubview(tableCellName)
        
    }
}
