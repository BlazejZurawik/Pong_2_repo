//
//  GameViewController.swift
//  Pong_2
//
//  Created by Blazej on 22/05/2019.
//  Copyright © 2019 Blazej. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            /* Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "MenuScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                scene.size = view.bounds.size // ustawia scene na podstawie wielkosci ekranu
                // Present the scene
                view.presentScene(scene)
            }*/
            
            let menuScene = MenuScene()
            menuScene.scaleMode = .aspectFill
            menuScene.size = view.bounds.size
            view.presentScene(menuScene)
            
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsNodeCount = false
            //view.showsPhysics = true // pokazuje fizyczne cialo na ekranie apliakcji
        }
    }
    
    override var shouldAutorotate: Bool {
        return false
    }		

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
