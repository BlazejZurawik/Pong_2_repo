//
//  StartGameScene.swift
//  Pong_2
//
//  Created by Blazej on 23/05/2019.
//  Copyright © 2019 Blazej. All rights reserved.
//

import SpriteKit
import GameplayKit


class StartGameScene: SKScene {
    
    var uvsuLabel = SKLabelNode()
    var goLabel = SKLabelNode()
    
    var uvsaiLAbel = SKLabelNode()
    var easyLabel = SKLabelNode()
    var mediumLabel = SKLabelNode()
    var hardLabel = SKLabelNode()
    
    var backLabel = SKLabelNode()
    
    override func didMove(to view: SKView) {
        initializeMenuObject()
        self.backgroundColor = GlobalVar.backgroundColor
        
    }
    
    private func initializeMenuObject() {
        
        uvsuLabel = SKLabelNode(fontNamed: "fortunecookies")
        uvsuLabel.position.x = (self.frame.width / 2)
        uvsuLabel.position.y = (self.frame.height / 2) + 180
        uvsuLabel.fontSize = 56
        uvsuLabel.fontColor = SKColor(red: 0.35, green: 0.86, blue: 0.41, alpha: 1)
        uvsuLabel.text = "User vs User"
        self.addChild(uvsuLabel)
        
        goLabel = SKLabelNode(fontNamed: "fortunecookies")
        goLabel.position.x = (self.frame.width / 2)
        goLabel.position.y = (self.frame.height / 2) + 120
        goLabel.fontSize = 36
        goLabel.name = "Go"
        goLabel.text = "Go!"
        self.addChild(goLabel)
        
        uvsaiLAbel = SKLabelNode(fontNamed: "fortunecookies")
        uvsaiLAbel.position.x = (self.frame.width / 2)
        uvsaiLAbel.position.y = (self.frame.height / 2) + 30
        uvsaiLAbel.fontSize = 56
        uvsaiLAbel.fontColor = SKColor(red: 0.35, green: 0.86, blue: 0.41, alpha: 1)
        uvsaiLAbel.text = "User vs Bot"
        self.addChild(uvsaiLAbel)
        
        easyLabel = SKLabelNode(fontNamed: "fortunecookies")
        easyLabel.position.x = (self.frame.width / 2)
        easyLabel.position.y = (self.frame.height / 2) - 30
        easyLabel.fontSize = 36
        easyLabel.name = "Easy"
        easyLabel.text = "Easy"
        self.addChild(easyLabel)
        
        mediumLabel = SKLabelNode(fontNamed: "fortunecookies")
        mediumLabel.position.x = (self.frame.width / 2)
        mediumLabel.position.y = (self.frame.height / 2) - 90
        mediumLabel.fontSize = 36
        mediumLabel.name = "Medium"
        mediumLabel.text = "Medium"
        self.addChild(mediumLabel)
        
        hardLabel = SKLabelNode(fontNamed: "fortunecookies")
        hardLabel.position.x = (self.frame.width / 2)
        hardLabel.position.y = (self.frame.height / 2) - 150
        hardLabel.fontSize = 36
        hardLabel.name = "Hard"
        hardLabel.text = "Hard"
        self.addChild(hardLabel)
        
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
                    
                } else if node.name == "Easy" {
                    
                    let gameScene2 = GameScene(fileNamed: "GameScene")
                    gameScene2?.scaleMode = .resizeFill
                    gameScene2?.gameModee = "easy"
                    self.view?.presentScene(gameScene2!, transition: transition1)
                    self.removeAllActions()
                    self.removeAllChildren()
                    
                } else if node.name == "Medium" {
                    
                    let gameScene3 = GameScene(fileNamed: "GameScene")
                    gameScene3?.scaleMode = .resizeFill
                    gameScene3?.gameModee = "medium"
                    self.view?.presentScene(gameScene3!, transition: transition1)
                    self.removeAllActions()
                    self.removeAllChildren()
                    
                } else if node.name == "Hard" {
                    
                    let gameScene4 = GameScene(fileNamed: "GameScene")
                    gameScene4?.scaleMode = .resizeFill
                    gameScene4?.gameModee = "hard"
                    self.view?.presentScene(gameScene4!, transition: transition1)
                    self.removeAllActions()
                    self.removeAllChildren()
                    
                } else if node.name == "Go" {
                    
                    let gameScene5 = GameScene(fileNamed: "GameScene")
                    gameScene5?.scaleMode = .resizeFill
                    gameScene5?.gameModee = "player2"
                    self.view?.presentScene(gameScene5!, transition: transition1)
                    self.removeAllActions()
                    self.removeAllChildren()
                    
                }
            }
        }
    }
    
}

