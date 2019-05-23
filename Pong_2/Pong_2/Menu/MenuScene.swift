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
    
    override func didMove(to view: SKView) {
        initializeMenuObject()
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    private func initializeMenuObject() {
       
        logoLabel = SKLabelNode(fontNamed: "fortunecookies")
        logoLabel.position.x = (self.frame.width / 2)
        logoLabel.position.y = (self.frame.height / 2) + 60
        logoLabel.fontSize = 100
        logoLabel.fontColor = SKColor(red: 0.35, green: 0.86, blue: 0.41, alpha: 1)
        logoLabel.text = "PoNG"
        self.addChild(logoLabel)
        
        playLabel = SKLabelNode(fontNamed: "fortunecookies")
        playLabel.position.x = (self.frame.width / 2)
        playLabel.position.y = (self.frame.height / 2) - 40
        playLabel.fontSize = 36
        playLabel.text = "Play"
        playLabel.name = "Play"
        self.addChild(playLabel)
        
        optionsLabel = SKLabelNode(fontNamed: "fortunecookies")
        optionsLabel.position.x = (self.frame.width / 2)
        optionsLabel.position.y = (self.frame.height / 2) - 90
        optionsLabel.fontSize = 36
        optionsLabel.text = "Options"
        optionsLabel.name = "Options"
        self.addChild(optionsLabel)
        
        scoreLabel = SKLabelNode(fontNamed: "fortunecookies")
        scoreLabel.position.x = (self.frame.width / 2)
        scoreLabel.position.y = (self.frame.height / 2) - 140
        scoreLabel.fontSize = 36
        scoreLabel.text = "Score"
        scoreLabel.name = "Score"
        self.addChild(scoreLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            let transition1 = SKTransition.flipHorizontal(withDuration: 0.5)
            for node in touchedNode{
                
                if node.name == "Play" {
                    
                    let gameScene1 = StartGameScene()
                    gameScene1.scaleMode = .resizeFill
                    self.view?.presentScene(gameScene1, transition: transition1)
                    self.removeAllActions()
                    self.removeAllChildren()
                    
                } else if node.name == "Options" {
                    
                    let gameScene2 = OptionScene()
                    gameScene2.scaleMode = .resizeFill
                    self.view?.presentScene(gameScene2, transition: transition1)
                    self.removeAllActions()
                    self.removeAllChildren()
                    
                } else if node.name == "Score" {
                    
                    let gameScene3 = ScoreScene()
                    gameScene3.scaleMode = .resizeFill
                    self.view?.presentScene(gameScene3, transition: transition1)
                    self.removeAllActions()
                    self.removeAllChildren()
                    
                }
                
            }
        }
    }
    
}
