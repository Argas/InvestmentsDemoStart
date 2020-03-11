//
//  UserServise.swift
//  Investments
//
//  Created by a.y.zverev on 10/03/2020.
//  Copyright © 2020 argas. All rights reserved.
//

import Foundation

struct User {
    let name: String
    let citizenship: String
}

protocol IUserService {
    var currentUser: User { get }
}

class UserService: IUserService {
    var currentUser: User {
        return User(name: "", citizenship: "RU")
    }
}
