//
//  Movie.swift
//  Cinema
//
//  Created by 陳家豪 on 2020/8/11.
//

import Foundation
import UIKit
struct Movie{
    var movieName:String
    var movieEnglishName:String
    var movieTag:Tag?
    var movieImage:UIImage?
    var movieDuration:Int
    var movieLevel: Level
}

enum Tag: String{
    case exclusive = "獨家獻映"
    case comprehensive = "全版本"
    case special = "特別推薦"
    case interactive = "互動電影"
    case reality = "真人演出"
    case classic = "經典重映"
    case general = ""
}
enum Level: String{
    case gRated = "普 0+"
    case pgRated = "護 6+"
    case rRated = "輔 12+"
    case nc17 = "限 18+"
}
