//
//  MenuScene.swift
//  Pong_2
//
//  Created by Blazej on 22/05/2019.
//  Copyright © 2019 Blazej. All rights reserved.
//

import SpriteKit
import GameplayKit

class MenuScene: SKScene {
    
    var logoLabel = SKLabelNode()
    var playLabel = SKLabelNode()
    var optionsLabel = SKLabelNode()
    var scoreLabel = SKLabelNode()
    var exitLabel = SKLabelNode()
    
    override func didMove(to view: SKView) {
        initializeMenuObject()
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    private func initializeMenuObject() {
       
        logoLabel = SKLabelNode(fontNamed: "fortunecookies")
        logoLabel.position.x = (self.frame.width / 2)
        logoLabel.position.y = (self.frame.height / 2) + 100
        logoLabel.fontSize = 100
        logoLabel.fontColor = SKColor(red: 0.6, green: 1, blue: 0.4, alpha: 1)
        logoLabel.text = "PoNG"
        self.addChild(logoLabel)
        
        playLabel = SKLabelNode(fontNamed: "fortunecookies")
        playLabel.position.x = (self.frame.width / 2)
        playLabel.position.y = (self.frame.height / 2) - 20
        playLabel.fontSize = 36
        playLabel.text = "Play"
        self.addChild(playLabel)
        
        optionsLabel = SKLabelNode(fontNamed: "fortunecookies")
        optionsLabel.position.x = (self.frame.width / 2)
        optionsLabel.position.y = (self.frame.height / 2) - 70
        optionsLabel.fontSize = 36
        optionsLabel.text = "Options"
        self.addChild(optionsLabel)
        
        scoreLabel = SKLabelNode(fontNamed: "fortunecookies")
        scoreLabel.position.x = (self.frame.width / 2)
        scoreLabel.position.y = (self.frame.height / 2) - 120
        scoreLabel.fontSize = 36
        scoreLabel.text = "Score"
        self.addChild(scoreLabel)
        
        exitLabel = SKLabelNode(fontNamed: "fortunecookies")
        exitLabel.position.x = (self.frame.width / 2)
        exitLabel.position.y = (self.frame.height / 2) - 170
        exitLabel.fontSize = 36
        exitLabel.text = "Exit"
        self.addChild(exitLabel)
        
    }
    
}
