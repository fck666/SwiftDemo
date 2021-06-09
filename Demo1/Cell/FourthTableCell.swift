//
//  RowViewController.swift
//  Demo1
//
//  Created by 58 on 2021/6/2.
//

import Foundation
import UIKit
import SnapKit
class FourthTableCell: UITableViewCell{
    static let identifierString = "CollectionTableViewCell"
    lazy var tableCellName : UILabel = {
        let titleLabel = UILabel()
        let height = contentView.frame.size.height
        titleLabel.textAlignment = NSTextAlignment.left
        return titleLabel
    }()
    lazy var numCell : UILabel = {
        let numLabel = UILabel()
        let height = contentView.frame.size.height
        numLabel.textAlignment = NSTextAlignment.justified
        return numLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setTableUI()
    }
    public func configNum(text:String){
        numCell.text = text
        numCell.backgroundColor = UIColor.red
        numCell.textColor = UIColor.white
        numCell.textAlignment = NSTextAlignment.center
        numCell.font = UIFont.boldSystemFont(ofSize: 15)
    }
    public func config(text:String){
        tableCellName.text = text
        tableCellName.textAlignment = NSTextAlignment.center
        tableCellName.backgroundColor = UIColor.white
        tableCellName.textColor = UIColor.black
        tableCellName.font = UIFont.systemFont(ofSize: 14)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension FourthTableCell{
    func setTableUI() {
        selectionStyle = UITableViewCell.SelectionStyle.gray
        contentView.backgroundColor = .white
        contentView.addSubview(tableCellName)
        contentView.addSubview(numCell)
        tableCellName.snp.makeConstraints{
            make in
            make.centerY.equalToSuperview()
            make.width.equalTo(contentView.snp_width).inset(10)
            make.height.equalTo(contentView.snp_height).inset(15)
            make.left.equalToSuperview().offset(10)
        }
        numCell.snp.makeConstraints{
            make in
            make.centerY.equalTo(contentView.snp_centerY)
            make.width.equalTo(contentView.snp_height).inset(20)
            make.height.equalTo(contentView.snp_height).inset(20)
            make.right.equalTo(contentView.snp_right)
        }
        numCell.layer.masksToBounds = true
        numCell.layer.cornerRadius = 10
    }
}
