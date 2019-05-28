//
//  userDataScoreUser.swift
//  Pong_2
//
//  Created by Blazej on 28/05/2019.
//  Copyright © 2019 Blazej. All rights reserved.
//

import Foundation

struct userDataScoreUser: Codable {
    
    var name:String!
    var score:Int!
    var score2:Int!
    var name2:String!
    
    init(name: String = "defoultUserName", score: Int, score2: Int, name2: String = "defoultUserName") {
        self.name = name
        self.score = score
        self.score2 = score2
        self.name2 = name2
    }
    
}
