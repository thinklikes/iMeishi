//
//  Contact.swift
//  iMeishi
//
//  Created by Rhys.K on 2024/7/22.
//

import Foundation

struct Contact: Codable {
    /// 聯絡人名稱
    var name: String = ""
    /// 聯絡人電話
    var phone: String = ""
    /// 聯絡人名片網址
    var image_url: String = ""
    
    init(name: String, phone: String, image_url: String) {
        self.name = name
        self.phone = phone
        self.image_url = image_url
    }
    
    init() {
    }
    
}
