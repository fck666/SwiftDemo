//
//  Department.swift
//  Demo1
//
//  Created by 58 on 2021/6/4.
//

import Foundation
struct PostList: Codable {
    var list: [Post]
}

struct Post: Codable, Identifiable {
    let id: Int
    let avatar: String // image name
    let vip: Bool
    let name: String
    let date: String // yyyy-MM-dd HH:mm:ss
    
    var isFollowed: Bool
    
    let text: String
    let images: [String] // image names
    
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
}

struct Department {
    var departmentName : String
    var departmentImage : String
}
struct DepartmentGroup {
    var departmentGroup : [Department]
}
struct CollectionGroup {
    var collectionData : [DepartmentGroup]
}
struct DepartmentData {
    static func departmentData()->DepartmentGroup{
        return DepartmentGroup(departmentGroup: [Department(departmentName: "视频研发部", departmentImage: "https://s.yimg.com/ny/api/res/1.2/1PBqRUz9PUOVu6SwMsM9eg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTY0MA--/https://s.yimg.com/uu/api/res/1.2/MtoB9u7ureZ32.Shqpwb0w--~B/aD0xMTkyO3c9MTc4ODthcHBpZD15dGFjaHlvbg--/https://media.zenfs.com/no/cmmedia.com.tw/34458e14623ea973dfd06042ca8c2c92"),Department(departmentName: "直播研发部", departmentImage: "https://pic1.zhimg.com/80/v2-f146f98fee867e9f2d6df193ed0e8ed8_1440w.jpg"),Department(departmentName: "AIlab", departmentImage: "https://img.technews.tw/wp-content/uploads/2019/05/22112811/tesla-Model-S.jpg"),Department(departmentName: "共享服务线", departmentImage: "https://p9.itc.cn/images01/20210401/d20bbc2faed746b5b520e39a4e4c60f2.jpeg"),Department(departmentName: "app开发", departmentImage: "https://res.gwm.com.cn/weysite/static/src/views/index/img/car-list/vv7-m.jpg"),Department(departmentName: "短视频", departmentImage: "https://image.bitautoimg.com/autoalbum/files/20190929/625/0651246259_6.jpg"),Department(departmentName: "前端", departmentImage: "https://cdn2.ettoday.net/images/4993/d4993699.jpg"),Department(departmentName: "后端", departmentImage: "https://www.mercedes-benz.com.cn/content/dam/mb-cn/model-list/phev/1/pc/1-gle-pc.png")])
    }
}
struct CollectionData {
    static func collectionData()->CollectionGroup{
        return CollectionGroup(collectionData: [DepartmentGroup(departmentGroup: [Department(departmentName: "视频研发部", departmentImage: "1"),Department(departmentName: "直播研发部", departmentImage: "2"),Department(departmentName: "AIlab", departmentImage: "3"),Department(departmentName: "共享服务线", departmentImage: "4"),Department(departmentName: "app开发", departmentImage: "5"),Department(departmentName: "短视频", departmentImage: "6"),Department(departmentName: "前端", departmentImage: "7"),Department(departmentName: "后端", departmentImage: "8")]),DepartmentGroup(departmentGroup: [Department(departmentName: "视频研发部", departmentImage: "2"),Department(departmentName: "直播研发部", departmentImage: "6"),Department(departmentName: "AIlab", departmentImage: "1"),Department(departmentName: "共享服务线", departmentImage: "3"),Department(departmentName: "app开发", departmentImage: "7"),Department(departmentName: "短视频", departmentImage: "4"),Department(departmentName: "前端", departmentImage: "5"),Department(departmentName: "后端", departmentImage: "8")]),DepartmentGroup(departmentGroup: [Department(departmentName: "视频研发部", departmentImage: "1"),Department(departmentName: "直播研发部", departmentImage: "2"),Department(departmentName: "AIlab", departmentImage: "3"),Department(departmentName: "共享服务线", departmentImage: "4"),Department(departmentName: "app开发", departmentImage: "5")]),DepartmentGroup(departmentGroup: [Department(departmentName: "视频研发部", departmentImage: "1"),Department(departmentName: "直播研发部", departmentImage: "2"),Department(departmentName: "后端", departmentImage: "8")]),DepartmentGroup(departmentGroup: [Department(departmentName: "视频研发部", departmentImage: "1"),Department(departmentName: "直播研发部", departmentImage: "2"),Department(departmentName: "AIlab", departmentImage: "3"),Department(departmentName: "共享服务线", departmentImage: "4")]),DepartmentGroup(departmentGroup: [Department(departmentName: "视频研发部", departmentImage: "1"),Department(departmentName: "共享服务线", departmentImage: "4"),Department(departmentName: "app开发", departmentImage: "5"),Department(departmentName: "短视频", departmentImage: "6"),Department(departmentName: "前端", departmentImage: "7"),Department(departmentName: "后端", departmentImage: "8")]),DepartmentGroup(departmentGroup: [Department(departmentName: "短视频", departmentImage: "6"),Department(departmentName: "前端", departmentImage: "7"),Department(departmentName: "后端", departmentImage: "8")]),DepartmentGroup(departmentGroup: [Department(departmentName: "视频研发部", departmentImage: "1"),Department(departmentName: "直播研发部", departmentImage: "2"),Department(departmentName: "共享服务线", departmentImage: "4"),Department(departmentName: "app开发", departmentImage: "5"),Department(departmentName: "短视频", departmentImage: "6"),Department(departmentName: "前端", departmentImage: "7"),Department(departmentName: "后端", departmentImage: "8")])])
    }
}
