//
//  Department.swift
//  Demo1
//
//  Created by 58 on 2021/6/4.
//

import Foundation

struct Department {
    var departmentName : String
    var departmentImage : String
}
struct DepartmentGroup {
    var departmentGroup : [Department]
}
struct DepartmentData {
    static func departmentData()->DepartmentGroup{
        return DepartmentGroup(departmentGroup: [Department(departmentName: "视频研发部", departmentImage: "1"),Department(departmentName: "直播研发部", departmentImage: "2"),Department(departmentName: "AIlab", departmentImage: "3"),Department(departmentName: "共享服务线", departmentImage: "4"),Department(departmentName: "app开发", departmentImage: "5"),Department(departmentName: "短视频", departmentImage: "6"),Department(departmentName: "前端", departmentImage: "7"),Department(departmentName: "后端", departmentImage: "8")])
    }
}
