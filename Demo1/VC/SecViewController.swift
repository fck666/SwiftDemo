//
//  SecViewController.swift
//  Demo1
//
//  Created by 58 on 2021/5/28.
//


//@available(iOS 14.0, *)
import UIKit
class SecViewController: UIViewController{
    
    
    @objc func tapped(mes : String){
        let des = MesViewController()
        des.message = mes
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(des, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    let table = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
    //    var sources = [1:"视频研发部",2:"直播研发部",3:"AIlab",4:"共享服务线",5:"app开发",6:"短视频",7:"前端",8:"后端"]
    
    var source = DepartmentData.departmentData()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupTableView()
    }
    private func setupTableView(){
        table.frame = view.bounds
        table.delegate = self
        table.dataSource = self
        table.register(SecTableCell.self, forCellReuseIdentifier: SecTableCell.identifierString)
        // Do any additional setup after loading the view.
        table.rowHeight = 80
        view.addSubview(table)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
//@available(iOS 14.0, *)
extension SecViewController :UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: title) as? RowViewController
        ////        cell.textLabel?.text = datasource[indexPath.row]
        //        cell.textLabel?.textColor = UIColor.black
        //        cell.backgroundView?.backgroundColor = UIColor.blue
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SecTableCell.identifierString, for: indexPath)as? SecTableCell else { return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: title) }
        cell.config(text: source.departmentGroup[indexPath.row].departmentName , image: source.departmentGroup[indexPath.row].departmentImage)
        
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
