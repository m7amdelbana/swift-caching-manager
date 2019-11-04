//
//  UserManager.swift
//  SwiftCachingManager
//
//  Created by Mohamed Elbana on 11/4/19.
//  Copyright © 2019 Mohamed Elbana. All rights reserved.
//

import UIKit

class UserManager: CachingManager {
    
    let KEY = "user_local_data"
    
    static var shared = UserManager()
    
    func save(user: User) {
        store(user, KEY)
    }
    
    func get() -> User! {
        return retrive(KEY)
    }
    
    func isExist() -> Bool {
        return isExist(KEY)
    }
    
    func logOut() {
        delete(KEY)
        unAuthenticate()
    }
    
    private func unAuthenticate() {
        /// Additional calling for functions
    }
}

