//
//  SecViewController.swift
//  Demo1
//
//  Created by 58 on 2021/5/28.
//

import UIKit
@available(iOS 14.0, *)
class SecViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: title)
        cell.textLabel?.text = datasource[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.backgroundView?.backgroundColor = UIColor.blue
       
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tapped(mes: datasource[indexPath.row])
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    // MARK: 滑动删除必须实现的方法
    // 如果没实现则无法策划
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            datasource.remove(at: indexPath.row)
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
    func tableview(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath:IndexPath) {
        
        
    }
    @objc func tapped(mes : String){
        let des = MesViewController()
        des.message = mes
        self.navigationController?.pushViewController(des, animated: true)
    }
   
    
    let table = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
    var datasource = ["视频研发部","直播研发部","AIlab","共享服务线","app开发","短视频","前端","后端"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        table.frame = view.bounds
        setupTableView()
        table.delegate = self
        table.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    private func setupTableView(){
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
