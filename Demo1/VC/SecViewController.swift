//
//  SecViewController.swift
//  Demo1
//
//  Created by 58 on 2021/5/28.
//


//@available(iOS 14.0, *)
import UIKit
import SnapKit
import Alamofire
import Kingfisher
import MJRefresh
class SecViewController: UIViewController{
    let header = MJRefreshNormalHeader()
    var text : [String] = []
    var tabRefreshDelegate : TabbarRefreshDelegate?
    @objc func tapped(mes : String){
        let des = MesViewController()
        des.message = mes
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(des, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    let table = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
    var source = DepartmentData.departmentData()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        getNetText()
        setupTableView()
        header.lastUpdatedTimeLabel!.isHidden = true
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        table.mj_header = header
    }
    @objc func headerRefresh(){
        table.mj_header?.beginRefreshing()
        print("下拉刷新.")
        refreshText()
        //重现加载表格数据
        table.reloadData()
        //结束刷新
        table.mj_header!.endRefreshing()
    }
    private func setupTableView(){
        table.delegate = self
        table.dataSource = self
        table.register(SecTableCell.self, forCellReuseIdentifier: SecTableCell.identifierString)
        // Do any additional setup after loading the view.
        table.rowHeight = view.bounds.height/10
        view.addSubview(table)
        table.snp.makeConstraints{(make)in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10))
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getNetText(){
        let url = "https://raw.githubusercontent.com/xiaoyouxinqing/PostDemo/master/PostDemo/Resources/PostListData_recommend_1.json"
        Alamofire.request(url).responseData{
            result in
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let listData = try decoder.decode(PostList.self, from: result.data!)
                for i in 0...7{
                    let element = listData.list[i]
                    self.text.append(element.name)}
            } catch { print(error) }
        }
    }
    func refreshText(){
        let url = "https://raw.githubusercontent.com/xiaoyouxinqing/PostDemo/master/PostDemo/Resources/PostListData_recommend_1.json"
        Alamofire.request(url).responseData{
            result in
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let listData = try decoder.decode(PostList.self, from: result.data!)
                for i in 0...7{
                    let element = listData.list[i]
                    self.text[i]=element.name}
            } catch { print(error) }
        }
    }
    
}
//@available(iOS 14.0, *)
extension SecViewController :UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: title) as? RowViewController
        ////        cell.textLabel?.text = datasource[indexPath.row]
        //        cell.textLabel?.textColor = UIColor.black
        //        cell.backgroundView?.backgroundColor = UIColor.blue
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SecTableCell.identifierString, for: indexPath)as? SecTableCell else { return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: title) }
        cell.config(text: text[indexPath.row], image: self.source.departmentGroup[indexPath.row].departmentImage)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tapped(mes: source.departmentGroup[indexPath.row].departmentName)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.departmentGroup.count
    }
    // MARK: 滑动删除必须实现的方法
    // 如果没实现则无法策划
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            source.departmentGroup.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
        print("删除\(indexPath.row)")
    }
    private func tableView(_ tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath)->Bool {
        return true
    }
    // 侧滑删除
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        //        datasource.remove(at: indexPath.row)
        //        tableView.deleteRows(at: [indexPath], with: .fade)
        //        tableView.reloadData()
        return UITableViewCell.EditingStyle.delete
    }
    // 设置侧滑的文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    
}
extension SecViewController: TabbarRefreshDelegate {
    func refresh() {
        table.mj_header?.beginRefreshing()
    }
}
