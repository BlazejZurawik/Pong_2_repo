//
//  GameScene.swift
//  Pong_2
//
//  Created by Blazej on 22/05/2019.
//  Copyright © 2019 Blazej. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
    var mainPaddle: SKSpriteNode!
    var enemyPaddle: SKSpriteNode!
    var ball: SKSpriteNode!
    var backLabel: SKSpriteNode!
    
    var score = [Int]()
    var scoreLabelMain = SKLabelNode()
    var scoreLabelEnemy = SKLabelNode()
    
    var gameModee:String = ""
    
    override func didMove(to view: SKView) {
        initializeGameObjects()
        startGame()
        
        
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame) // tworzy granice dookola calego ekranu
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
    }
    
    func startGame() {
        score = [0, 0]
        
        scoreLabelEnemy.text = "\(score[1])" //przekszatalca liczbe z tabeli na tekst
        scoreLabelMain.text = "\(score[0])"
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 2, dy: 2)) // impuls wprawiajacy pileczke w ruch (im wiecej w dx i dy tym mocniejszy jest "wystrzal" -- nie do konca rozumiem jak to dziala)
        
        /*petla wyswietlajaca wszystkie fonty w systemie i mowiaca nam pod jaka nazwa mozemy je znalezc
         for family: String in UIFont.familyNames
         {
         print(family)
         for names: String in UIFont.fontNames(forFamilyName: family)
         {
         print("== \(names)")
         }
         }*/
 
    }
    
    //metoda odpowiedzialna za resetowanie pileczki po kazdym zdobytym punkcie jak i inkrementacje scora (czyli naszych punktow)
    func addScore(addPoint: SKSpriteNode) {
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        if addPoint == mainPaddle{
            
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 2, dy: 2))
        } else if addPoint == enemyPaddle{
            
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -2, dy: -2))
        }
        
        scoreLabelEnemy.text = "\(score[1])"
        scoreLabelMain.text = "\(score[0])"
    }
    
    //metoda odpowiedzialna za wykrycie dotyku na ekranie
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            let location = touch.location(in: self)
            if gameModee == "player2"{
                if location.y < self.frame.size.width - 284
                {
                    mainPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
                } else {
                    enemyPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
            } else {
                mainPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
        }
        
        for touch: AnyObject in touches{
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            let transition1 = SKTransition.doorsCloseVertical(withDuration: 0.5)
            for node in touchedNode{
                
                if node.name == "back" {

                    
                    // TRANSITION TO LEADERBOARD SCENE
                    let gameScene1 = MenuScene()
                    gameScene1.scaleMode = .resizeFill
                    self.view?.presentScene(gameScene1, transition: transition1)
                    self.removeAllActions()
                    self.removeAllChildren()
                    
                }
            }
        }
        
         /*// warunek mowi mi w jaka pozycje na ekranie dotknalem
         if let touch = touches.first {
         let position = touch.location(in: view)
         print(position)
         }*/
        
    }
    
    //metoda odpowiedzialna za wykrycie przesuniecia palcem po ekranie
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            let location = touch.location(in: self)
            
            if gameModee == "player2"{
                if location.y < self.frame.size.width - 284
                {
                    mainPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
                } else {
                    enemyPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
            } else {
                mainPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }

        }
    }
    
    
    //metoda odpowiedzialna za AI enemy i score
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        //powinno znajdowac sie tutaj jak naj mniej rzeczy aby nie "zamulac" programu
    
        if gameModee == "easy" {
            
            enemyPaddle.run(SKAction.moveTo(x: ball.position.x, duration: 1.2))
            
        } else if gameModee == "medium" {
            
            enemyPaddle.run(SKAction.moveTo(x: ball.position.x, duration: 0.8))
            
            
        } else if gameModee == "hard" {
            
            enemyPaddle.run(SKAction.moveTo(x: ball.position.x, duration: 0.6))
            
            
        } else if gameModee == "player2" {
            
        }
        
        if ball.position.y <= mainPaddle.position.y - 35 {
            
            addScore(addPoint: enemyPaddle)
        } else if ball.position.y >= enemyPaddle.position.y + 35 {
            
            addScore(addPoint: mainPaddle)
        }
    }
    
    
    private  func initializeGameObjects(){
        
        mainPaddle = SKSpriteNode(imageNamed: "mainPaddle")
        //mainPaddle.position = CGPoint(x: 0, y: (frame.size.height / -2) + 100)
        mainPaddle.position.y = (-self.frame.height / 2) + 50
        mainPaddle.size = CGSize(width: 100, height: 15)
        mainPaddle.name = "main"
        mainPaddle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: mainPaddle.size.width, height: mainPaddle.size.height)) // tworzy fizyczne cialo w ksztalcie prostokata
        mainPaddle.physicsBody?.isDynamic = false
        mainPaddle.physicsBody?.allowsRotation = false
        mainPaddle.physicsBody?.affectedByGravity = false
        mainPaddle.physicsBody?.friction = 0 // tarcie
        mainPaddle.physicsBody?.restitution = 0 // oddanie energii  przy odbiciu
        mainPaddle.physicsBody?.categoryBitMask = 1
        mainPaddle.physicsBody?.collisionBitMask = 2 // z czym bedzie kolidowac nasza paletka
        mainPaddle.physicsBody?.fieldBitMask = 0
        mainPaddle.physicsBody?.contactTestBitMask = 2 // z czym bedziesz kolidowac
        self.addChild(mainPaddle)
        
        enemyPaddle = SKSpriteNode(imageNamed: "enemyPaddle")
        //enemyPaddle.position = CGPoint(x: 0, y: (frame.size.height / 2) - 100)
        enemyPaddle.position.y = (self.frame.height / 2) - 50
        enemyPaddle.size = CGSize(width: 100, height: 15)
        enemyPaddle.name = "enemy"
        enemyPaddle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: enemyPaddle.size.width, height: enemyPaddle.size.height)) // tworzy fizyczne cialo w ksztalcie prostokata
        enemyPaddle.physicsBody?.isDynamic = false
        enemyPaddle.physicsBody?.allowsRotation = false
        enemyPaddle.physicsBody?.affectedByGravity = false
        enemyPaddle.physicsBody?.friction = 0 // tarcie
        enemyPaddle.physicsBody?.restitution = 0 // oddanie energii  przy odbiciu
        enemyPaddle.physicsBody?.categoryBitMask = 1
        enemyPaddle.physicsBody?.collisionBitMask = 2 // z czym bedzie kolidowac nasza paletka
        enemyPaddle.physicsBody?.fieldBitMask = 0
        enemyPaddle.physicsBody?.contactTestBitMask = 2 // z czym bedziesz kolidowac
        self.addChild(enemyPaddle)
        
        ball = SKSpriteNode(imageNamed: "ball")
        ball.position = CGPoint(x: 0, y: 0)
        ball.size = CGSize(width: 15, height: 15)
        ball.name = "ball"
        ball.physicsBody = SKPhysicsBody(circleOfRadius: max(ball.size.width / 2, ball.size.height / 2)) // tworzy fizyczne cialo w ksztalcie kuli
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.friction = 0 // tarcie
        ball.physicsBody?.restitution = 1 // oddanie energii  przy odbiciu
        ball.physicsBody?.categoryBitMask = 2
        ball.physicsBody?.collisionBitMask = 1 // z czym bedziesz kolidowac pileczka
        ball.physicsBody?.fieldBitMask = 0
        ball.physicsBody?.contactTestBitMask = 1 // z czym bedziesz kolidowac pileczka
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.angularDamping = 0
        self.addChild(ball)
        
        scoreLabelMain = SKLabelNode(fontNamed: "fortunecookies")
        //scoreLabelMain.position = CGPoint(x: 330, y: -70)
        scoreLabelMain.position.x = (self.frame.width / 2) - 20
        scoreLabelMain.position.y = (self.frame.height / -2) + 240
        scoreLabelMain.fontSize = 24
        scoreLabelMain.name = "scoreMain"
        self.addChild(scoreLabelMain)
        
        scoreLabelEnemy = SKLabelNode(fontNamed: "fortunecookies")
        //scoreLabelEnemy.position = CGPoint(x: 330, y: +70)
        scoreLabelEnemy.position.x = (self.frame.width / 2) - 20
        scoreLabelEnemy.position.y = (self.frame.height / 2) - 240
        scoreLabelEnemy.zRotation = CGFloat.pi // odwrocenie labela o 180*
        scoreLabelEnemy.fontSize = 24
        scoreLabelEnemy.name = "scoreEnemy"
        self.addChild(scoreLabelEnemy)
        
        backLabel = SKSpriteNode(imageNamed: "arrow-1")
        backLabel.position.x = (self.frame.width / 2) - 20
        backLabel.position.y = (self.frame.height / 2) - 284
        backLabel.size = CGSize(width: 20, height: 20)
        backLabel.name = "back"
        self.addChild(backLabel)
    }
    
    
}
