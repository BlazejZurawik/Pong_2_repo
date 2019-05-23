//
//  ScoreScene.swift
//  Pong_2
//
//  Created by Blazej on 23/05/2019.
//  Copyright © 2019 Blazej. All rights reserved.
//

import SpriteKit
import GameplayKit

class ScoreScene: SKScene {
    
    var scoreLabel = SKLabelNode()
    var backLabel = SKLabelNode()
    
    override func didMove(to view: SKView) {
        initializeMenuObject()
    }
    
    private func initializeMenuObject()
    {
        scoreLabel = SKLabelNode(fontNamed: "fortunecookies")
        scoreLabel.position.x = (self.frame.width / 2)
        scoreLabel.position.y = (self.frame.height / 2) + 180
        scoreLabel.fontSize = 56
        scoreLabel.fontColor = SKColor(red: 0.35, green: 0.86, blue: 0.41, alpha: 1)
        scoreLabel.text = "Score"
        self.addChild(scoreLabel)
        
        backLabel = SKLabelNode(fontNamed: "fortunecookies")
        backLabel.position.x = (self.frame.width / 2) - 110
        backLabel.position.y = (self.frame.height / 2) - 260
        backLabel.fontSize = 36
        backLabel.fontColor = SKColor(red: 0.85, green: 0.36, blue: 0.38, alpha: 1)
        backLabel.text = "Back"
        backLabel.name = "Back"
        self.addChild(backLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            let transition1 = SKTransition.doorsCloseVertical(withDuration: 0.5)
            for node in touchedNode{
                
                if node.name == "Back" {
                    
                    let gameScene1 = MenuScene()
                    gameScene1.scaleMode = .resizeFill
                    self.view?.presentScene(gameScene1, transition: transition1)
                    self.removeAllActions()
                    self.removeAllChildren()
                    
                } else {
                    
                    
                }
            }
        }
    }
}
