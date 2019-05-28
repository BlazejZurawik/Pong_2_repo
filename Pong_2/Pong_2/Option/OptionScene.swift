//
//  OptionScene.swift
//  Pong_2
//
//  Created by Blazej on 23/05/2019.
//  Copyright © 2019 Blazej. All rights reserved.
//

import SpriteKit
import GameplayKit

class OptionScene: SKScene {

    var optionsLabel = SKLabelNode()
    
    var nameLabel = SKLabelNode()
    var userNameTextField:UITextField!
    
    var modeLabel = SKLabelNode()
    var flag = true
    
    var clearScore = SKLabelNode()

    var backLabel = SKLabelNode()
    
    
    
    override func didMove(to view: SKView) {
        initializeMenuObject()
    }
    
    private func initializeMenuObject()
    {
        optionsLabel = SKLabelNode(fontNamed: "fortunecookies")
        optionsLabel.position.x = (self.frame.width / 2)
        optionsLabel.position.y = (self.frame.height / 2) + 180
        optionsLabel.fontSize = 56
        optionsLabel.fontColor = SKColor(red: 0.35, green: 0.86, blue: 0.41, alpha: 1)
        optionsLabel.text = "Options"
        self.addChild(optionsLabel)
        
        nameLabel = SKLabelNode(fontNamed: "fortunecookies")
        nameLabel.position.x = (self.frame.width / 2)
        nameLabel.position.y = (self.frame.height / 2) + 60
        nameLabel.fontSize = 36
        nameLabel.text = "Name"
        self.addChild(nameLabel)
        
        modeLabel = SKLabelNode(fontNamed: "fortunecookies")
        modeLabel.position.x = (self.frame.width / 2)
        modeLabel.position.y = (self.frame.height / 2) - 60
        modeLabel.fontSize = 36
        modeLabel.text = "Dark mode  ON"
        modeLabel.name = "modeLabel"
        self.addChild(modeLabel)
        
        clearScore = SKLabelNode(fontNamed: "fortunecookies")
        clearScore.position.x = (self.frame.width / 2)
        clearScore.position.y = (self.frame.height / 2) - 120
        clearScore.fontSize = 36
        clearScore.name = "ClearScore"
        clearScore.text = "Clear Score table"
        self.addChild(clearScore)
        
        backLabel = SKLabelNode(fontNamed: "fortunecookies")
        backLabel.position.x = (self.frame.width / 2) - 110
        backLabel.position.y = (self.frame.height / 2) - 260
        backLabel.fontSize = 36
        backLabel.fontColor = SKColor(red: 0.85, green: 0.36, blue: 0.38, alpha: 1)
        backLabel.text = "Back"
        backLabel.name = "Back"
        self.addChild(backLabel)
        
        
        let textFieldFrame = CGRect(x: (self.frame.width / 2) - 100, y: (self.frame.height / 2) - 50, width: 200, height: 60)
        userNameTextField = UITextField(frame: textFieldFrame)
        
        view?.addSubview(userNameTextField)
        userNameTextField.layer.cornerRadius = 10.0
        userNameTextField.layer.borderWidth = 2
        userNameTextField.layer.borderColor = UIColor.black.cgColor
        userNameTextField.textAlignment = .center
        userNameTextField.backgroundColor = .lightGray
        userNameTextField.textColor = .black
        userNameTextField.clearButtonMode = .whileEditing
        userNameTextField.returnKeyType = .done
        let data =  UserDefaults.standard.string(forKey: "userName") ?? "Enter your name"
        userNameTextField.text = data
        userNameTextField.placeholder = "Enter your name"
        self.view?.addSubview(userNameTextField)
        
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
                    userNameTextField.removeFromSuperview()
                    self.removeAllChildren()
                    UserDefaults.standard.set(userNameTextField.text, forKey: "userName") //dodaje do pamieci podrecznej text pod keyem userName
                    
                    
                } else if node.name == "ClearScore" {
                    
                    let userDefaults = UserDefaults.standard
                    let leaderBoardData2: [userDataScore] = []
                    userDefaults.set(try? PropertyListEncoder().encode(leaderBoardData2), forKey: "leaderBoard")
                    
                    let userDefaultsUser = UserDefaults.standard
                    let leaderBoardData2User: [userDataScoreUser] = []
                    userDefaultsUser.set(try? PropertyListEncoder().encode(leaderBoardData2User), forKey: "leaderBoardUser")
                    
                    clearScore.text = "Score cleared"
                    
                } else if node.name == "modeLabel" {
                    
                    if flag == true {
                        modeLabel.text = "Dark mode  OFF"
                        flag = false
                    } else if flag == false {
                        modeLabel.text = "Dark mode  ON"
                        flag = true
                    }

                    
                } else{
                    
                    userNameTextField.endEditing(true)
                }
            }
        }
    }
}
