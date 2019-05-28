//
//  userDataScore.swift
//  Pong_2
//
//  Created by Blazej on 27/05/2019.
//  Copyright © 2019 Blazej. All rights reserved.
//

import Foundation

struct userDataScore: Codable {
    
    var name:String!
    var score:Int!
    var score2:Int!
    
    init(name: String = "defoultUserName", score: Int, score2: Int) {
        self.name = name
        self.score = score
        self.score2 = score2
    }
    
}


