//
//  UserDefault+Value.swift
//  race
//
//  Created by Ekaterina Abramova on 22.10.2020.
//  Copyright © 2020 Ekaterina Abramova. All rights reserved.
//
import Foundation

extension UserDefaults {
    func setValue(_ value: Any?, forKey key: UserDefaultsKeys) {
        setValue(value, forKey: key.rawValue)
    }
}
