//
//  UserDefaults.swift
//  Belarus
//
//  Created by user on 20.10.22.
//

import Foundation
import UIKit

extension UserDefaults  {
    func set(_ value: Any?, forKey key: UserDefaultsKeys) {
        set(value, forKey: key.rawValue)
    }
    
    func value(forKey key: UserDefaultsKeys) -> Any? {
        return value(forKey: key.rawValue)
    }
}
