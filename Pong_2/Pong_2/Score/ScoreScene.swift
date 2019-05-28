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
    var aiScore = SKLabelNode()
    var userScore = SKLabelNode()
    
    var leaderboardTextView: UITextView!
    var leaderboardTextViewUser: UITextView!
    
    var flagScore = true
    
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
        
        aiScore = SKLabelNode(fontNamed: "fortunecookies")
        aiScore.position.x = (self.frame.width / 2) - 85
        aiScore.position.y = (self.frame.height / 2) - 200
        aiScore.fontSize = 28
        aiScore.fontColor = SKColor(red: 0.35, green: 0.86, blue: 0.41, alpha: 0.7)
        aiScore.text = "User vs AI"
        aiScore.name = "UvAI"
        self.addChild(aiScore)
        
        userScore = SKLabelNode(fontNamed: "fortunecookies")
        userScore.position.x = (self.frame.width / 2) + 75
        userScore.position.y = (self.frame.height / 2) - 200
        userScore.fontSize = 28
        userScore.fontColor = SKColor(red: 0.35, green: 0.86, blue: 0.41, alpha: 1)
        userScore.text = "User vs User"
        userScore.name = "UvU"
        self.addChild(userScore)
        
        //tablica user AI
        let leaderboardFrame = CGRect(x: (self.frame.width / 2) - 100, y: (self.frame.height / 2) - 150 , width: 225, height: 377)
        leaderboardTextView = UITextView(frame: leaderboardFrame)
        leaderboardTextView.font = UIFont(name: "Georgia-Bold", size: 25)
        leaderboardTextView.text = ""
        leaderboardTextView.isUserInteractionEnabled = false
        leaderboardTextView.isEditable = false
        leaderboardTextView.isScrollEnabled = true
        leaderboardTextView.backgroundColor = UIColor.clear
        leaderboardTextView.textColor = UIColor.white
        
        
        let userDefaults = UserDefaults.standard
        var position:Int = 1
        if let data = userDefaults.value(forKey: "leaderBoard") as? Data {
            let leaderBoardData2 = try? PropertyListDecoder().decode(Array<userDataScore>.self, from: data)
            for i in leaderBoardData2!{
                var newName:String? = i.name!
                if let newName2 = newName{
                    leaderboardTextView.text.append("\(position). " + "\(String(describing: newName2))  \(String(describing: i.score!)) : \(String(describing: i.score2!))" + "\n" )
                }
                
                position += 1
            }
        }
        self.view?.addSubview(leaderboardTextView)
        
        // tablica user user
        let leaderboardFrameUser = CGRect(x: (self.frame.width / 2) - 100, y: (self.frame.height / 2) - 150 , width: 225, height: 377)
        leaderboardTextViewUser = UITextView(frame: leaderboardFrameUser)
        leaderboardTextViewUser.font = UIFont(name: "Georgia-Bold", size: 25)
        leaderboardTextViewUser.text = "tescik"
        leaderboardTextViewUser.isUserInteractionEnabled = false
        leaderboardTextViewUser.isEditable = false
        leaderboardTextViewUser.isScrollEnabled = true
        leaderboardTextViewUser.backgroundColor = UIColor.clear
        leaderboardTextViewUser.textColor = UIColor.white

        
        let userDefaultsUser = UserDefaults.standard
        var positionUser:Int = 1
        if let data = userDefaultsUser.value(forKey: "leaderBoardUser") as? Data {
            let leaderBoardData2User = try? PropertyListDecoder().decode(Array<userDataScoreUser>.self, from: data)
            for i in leaderBoardData2User!{
                var newNameUser:String? = i.name!
                var newNameEnemy:String? = "Enemy"
                if let newName2User = newNameUser{
                    leaderboardTextView.text.append("\(positionUser). " + "\(String(describing: newName2User))  \(String(describing: i.score!)) : \(String(describing: i.score2!)) \(String(describing: newNameEnemy))" + "\n" )
                }
                
                positionUser += 1
            }
        }
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
                    leaderboardTextView.removeFromSuperview()
                    leaderboardTextViewUser.removeFromSuperview()
                    self.removeAllChildren()
                    
                    
                } else if node.name == "UvAI" {
                    
                    if flagScore == false {
                        leaderboardTextViewUser.removeFromSuperview()
                        self.view?.addSubview(leaderboardTextView)
                    }
                        flagScore = true
                    
                    userScore.fontColor = SKColor(red: 0.35, green: 0.86, blue: 0.41, alpha: 1)
                    aiScore.fontColor = SKColor(red: 0.35, green: 0.86, blue: 0.41, alpha: 0.7)
                    
                } else if node.name == "UvU"{
                    
                    if flagScore == true {
                        leaderboardTextView.removeFromSuperview()
                        self.view?.addSubview(leaderboardTextViewUser)
                    }
                        flagScore = false
                    
                    userScore.fontColor = SKColor(red: 0.35, green: 0.86, blue: 0.41, alpha: 0.7)
                    aiScore.fontColor = SKColor(red: 0.35, green: 0.86, blue: 0.41, alpha: 1)
                    
                    
                    
                } else {
                    leaderboardTextView.endEditing(true)
                    
                }
            }
        }
    }
}
