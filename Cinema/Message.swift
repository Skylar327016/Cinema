//
//  model.swift
//  Cinema
//
//  Created by 陳家豪 on 2020/8/8.
//

import Foundation
import UIKit
struct Message{
    let date:Date
    var messageDate:String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self.date)
    }
    var messageContent:String
    var messageTime:String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self.date)
    }
    let systemPhoto:UIImage
}
