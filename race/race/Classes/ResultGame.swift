//
//  ResultGame.swift
//  race
//
//  Created by Ekaterina Abramova on 13.11.2020.
//  Copyright © 2020 Ekaterina Abramova. All rights reserved.
//

import Foundation

class ResultGame: Codable {
    var userName: String
    var time: String
    var score: Int
    init(userName: String?, time: String?, score: Int?) {
        self.userName = userName ?? "Defaulf name"
        self.time = time ?? "Unknow"
        self.score = score ?? 0
    }
}
