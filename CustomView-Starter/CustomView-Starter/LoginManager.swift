//
//  LoginManager.swift
//  CustomView-Starter
//
//  Created by 정유진 on 2022/08/10.
//

import Foundation

struct LoginManager {
    
    private let id = "admin"
    let password = "temp"
    
    func check(id: String, password: String)-> Bool {
        guard id == self.id && password == self.password
    }
}
