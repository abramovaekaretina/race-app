//
//  UserDefault+SaveClass.swift
//  race
//
//  Created by Ekaterina Abramova on 28.10.2020.
//  Copyright © 2020 Ekaterina Abramova. All rights reserved.
//

import Foundation

extension UserDefaults {
    func keepUser(forKey key: String) {
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error)
        }
    }
}
