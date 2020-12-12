//
//  UserDefaultsClass.swift
//  race
//
//  Created by Ekaterina Abramova on 28.10.2020.
//  Copyright © 2020 Ekaterina Abramova. All rights reserved.
//

import Foundation

class User: Codable {
    var userName: String
    var userObstacleImageName: String
    var userCarImageName: String
    var userSpeedCar: Double
    init(userName: String?, userObstacleImageName: String?, userCarImageName: String?, userSpeedCar: Double?) {
        self.userName = userName ?? "Default name"
        self.userObstacleImageName = userObstacleImageName ?? "Default obstacle image"
        self.userCarImageName = userCarImageName ?? "Default car image"
        self.userSpeedCar = userSpeedCar ?? 0
    }
}
