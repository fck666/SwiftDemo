//
//  SecViewController.swift
//  Demo1
//
//  Created by 58 on 2021/5/28.
//

import UIKit
@available(iOS 14.0, *)
class RowViewController: UITableViewCell{
    static let identifierString = "GroupTableViewCell"
    private var ImageView = UIImageView()
    private var titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        ImageView.contentMode = .scaleAspectFit
        contentView.addSubview(ImageView)
        contentView.addSubview(titleLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let height = contentView.frame.size.height
        ImageView.frame = CGRect(x: 10, y: 0, width: height, height: height)
        titleLabel.frame = CGRect(x: ImageView.frame.maxX + 10, y: 0, width: contentView.bounds.size.width - height - 10, height: height)
        
    }
    public func config(text:String,image: Int){
        titleLabel.text = text
        ImageView.image = UIImage(named: String(image))
        titleLabel.backgroundColor = UIColor.white
        titleLabel.textColor = UIColor.blue
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
@available(iOS 14.0, *)
class SecViewController: UIViewController{
    
   
    @objc func tapped(mes : String){
        let des = MesViewController()
        des.message = mes
        
        self.navigationController?.pushViewController(des, animated: true)
    }
    let table = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
//    var sources = [1:"视频研发部",2:"直播研发部",3:"AIlab",4:"共享服务线",5:"app开发",6:"短视频",7:"前端",8:"后端"]
    
    var datasource = ["视频研发部","直播研发部","AIlab","共享服务线","app开发","短视频","前端","后端"]
    var sources = [1,2,3,4,5,6,7,8]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        table.frame = view.bounds
        setupTableView()
        table.delegate = self
        table.dataSource = self
        table.register(RowViewController.self, forCellReuseIdentifier: RowViewController.identifierString)
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
@available(iOS 14.0, *)
extension SecViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: title) as? RowViewController
////        cell.textLabel?.text = datasource[indexPath.row]
//        cell.textLabel?.textColor = UIColor.black
//        cell.backgroundView?.backgroundColor = UIColor.blue
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RowViewController.identifierString, for: indexPath)as? RowViewController else { return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: title) }
        cell.config(text: datasource[indexPath.row] , image: sources[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tapped(mes: datasource[indexPath.row] )
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    // MARK: 滑动删除必须实现的方法
    // 如果没实现则无法策划
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            datasource.remove(at: indexPath.row)
            sources.remove(at: indexPath.row)
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
