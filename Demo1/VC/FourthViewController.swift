//
//  CollectionViewController.swift
//  Demo1
//
//  Created by 58 on 2021/6/3.
//
import  UIKit
class FourthViewController: UIViewController {
    let des = DetailViewController()
    var message : String?
    var tableCellNum : [Int] = [0,0,0,0,0,0,0,0]
    let collectionData = CollectionData.collectionData()
    var selectedRow = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        view.addSubview(collection)
        setUpTable()
        getClosureValue()
    }
    func getClosureValue(){
        des.myCol = {(_ text:[Int]) ->Void in
            print("闭包传过来的值为\(text)")
            self.tableCellNum = text
            self.table.reloadData()
        }
    }
    lazy var collection : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: 60 , height: 80)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 25
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView(frame: CGRect(x: view.bounds.maxX/4, y: 0, width: view.bounds.width-view.bounds.width/4+1, height: view.bounds.height), collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        collection.register(FourthCollectionCell.self, forCellWithReuseIdentifier: FourthCollectionCell.identifierString)
        return collection
    }()
    let table = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
    func setUpTable(){
        table.frame = CGRect(x: 0, y: 50, width: view.bounds.width/4+1, height: view.bounds.height)
        table.delegate = self
        table.dataSource = self
        table.register(FourthTableCell.self, forCellReuseIdentifier: FourthTableCell.identifierString)
        table.rowHeight = 60
        view.addSubview(table)
    }
    
    @objc func tap(mes : String){
        des.message = mes
        des.row = selectedRow
        self.navigationController?.pushViewController(des, animated: true)
    }
    
    
}
extension FourthViewController :UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        let collectionData = CollectionData.collectionData()
        return collectionData.collectionData[selectedRow].departmentGroup.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FourthCollectionCell.identifierString, for: indexPath) as! FourthCollectionCell
        
        cell.config(text: collectionData.collectionData[selectedRow].departmentGroup[indexPath.item].departmentName, image: collectionData.collectionData[selectedRow].departmentGroup[indexPath.item].departmentImage)
        cell.backgroundColor = UIColor.black
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        tap(mes: collectionData.collectionData[selectedRow].departmentGroup[indexPath.item].departmentName)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = DepartmentData.departmentData()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FourthTableCell.identifierString, for: indexPath)as? FourthTableCell else { return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: title) }
        cell.config(text: data.departmentGroup[indexPath.row].departmentName)
        if tableCellNum[indexPath.row] != 0{
            cell.configNum(text: String(tableCellNum[indexPath.row]))
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        selectedRow = indexPath.row
        collection.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = DepartmentData.departmentData()
        return data.departmentGroup.count
    }
}
