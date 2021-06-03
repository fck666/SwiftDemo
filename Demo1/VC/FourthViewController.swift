//
//  CollectionViewController.swift
//  Demo1
//
//  Created by 58 on 2021/6/3.
//
import  UIKit
class FourthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        setUpCollection()
        setUpTable()
    }
    func setUpCollection()  {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: 60 , height: 80)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 25
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView(frame: CGRect(x: view.bounds.maxX/4, y: view.bounds.minY, width: view.bounds.width-view.bounds.width/4, height: view.bounds.height), collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        collection.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.identifierString)
        view.addSubview(collection)
    }
    let table = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
    func setUpTable(){
        table.frame = CGRect(x: 0, y: 50, width: view.bounds.width/4, height: view.bounds.height)
        table.delegate = self
        table.dataSource = self
        table.register(CollectionTableCell.self, forCellReuseIdentifier: CollectionTableCell.identifierString)
        table.rowHeight = 60
        view.addSubview(table)
    }
}
extension FourthViewController :UICollectionViewDelegate,UICollectionViewDataSource{
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.identifierString, for: indexPath) as! CollectionCell
        cell.config(text: "666", image: 5)
        cell.backgroundColor = UIColor.black
        return cell
    }
}
extension FourthViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableCell.identifierString, for: indexPath)as? CollectionTableCell else { return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: title) }
        cell.config(text: "666")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
//        tapped(mes: datasource[indexPath.row] )
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
}
