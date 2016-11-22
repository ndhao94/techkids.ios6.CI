//
//  GameOver.swift
//  Sesson1
//
//  Created by Admin on 11/12/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import SpriteKit
import GameplayKit

class OverScene: SKScene{
    
    override func didMove(to view: SKView) {
        addBackground()
    }
    
    func addBackground() {
        let gameOverBackGround = SKSpriteNode(imageNamed: "gameover.jpg")
        gameOverBackGround.anchorPoint = CGPoint(x: 0, y: 0)
        gameOverBackGround.position = CGPoint(x: 0, y: 0)
        self.addChild(gameOverBackGround)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}
