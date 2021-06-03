//
//  RowViewController.swift
//  Demo1
//
//  Created by 58 on 2021/6/2.
//

import Foundation
import UIKit

class CollectionTableCell: UITableViewCell{
    static let identifierString = "CollectionTableViewCell"
    lazy var tableCellName : UILabel = {
        let titleLabel = UILabel()
        let height = contentView.frame.size.height
        titleLabel.frame = CGRect(x: 30, y: 16, width: contentView.bounds.width-10, height: contentView.bounds.height-10)
        return titleLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setTableUI()
    }
    
    public func config(text:String){
        tableCellName.text = text
        tableCellName.backgroundColor = UIColor.white
        tableCellName.textColor = UIColor.black
        tableCellName.font = UIFont.systemFont(ofSize: 20)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension CollectionTableCell{
    func setTableUI() {
        selectionStyle = UITableViewCell.SelectionStyle.gray
        contentView.backgroundColor = .white
        contentView.addSubview(tableCellName)
    }
}
