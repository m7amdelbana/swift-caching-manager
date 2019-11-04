//
//  CachingManager.swift
//  SwiftCachingManager
//
//  Created by Mohamed Elbana on 11/4/19.
//  Copyright © 2019 Mohamed Elbana. All rights reserved.
//

import UIKit

class CachingManager {
    
    let defaults = UserDefaults.standard
    
    func store<T>(_ object: T, _ key: String) {
        let data = NSKeyedArchiver.archivedData(withRootObject: object)
        defaults.set(data, forKey: key)
        defaults.synchronize()
    }
    
    func retrive<T>(_ key: String) -> T! {
        if isExist(key) {
            let data = defaults.object(forKey: key) as? Data
            let object = NSKeyedUnarchiver.unarchiveObject(with: data!) as! T
            return object
        } else {
            return nil
        }
    }
    
    func isExist(_ key: String) -> Bool {
        return defaults.object(forKey: key) != nil
    }
    
    func delete(_ key: String) {
        if defaults.object(forKey: key) != nil {
            defaults.removeObject(forKey: key)
        }
    }
}

