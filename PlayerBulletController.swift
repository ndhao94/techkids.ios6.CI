//
//  PlayerController.swift
//  Sesson1
//
//  Created by Admin on 11/10/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import SpriteKit

class PlayerBulletController : Controller{
    
//    let view : SKSpriteNode = SKSpriteNode(imageNamed: "bullet")
    let SPEED: CGFloat = 300.00
    
    init(){
        super.init(view: SKSpriteNode(texture: PLAYER_BULLET_TEXTURE))
        view.name = "player_bullet"
        
        view.physicsBody = SKPhysicsBody(texture: PLAYER_BULLET_TEXTURE, size: view.size)
        view.physicsBody?.categoryBitMask = PLAYER_BULLET_MASK
        view.physicsBody?.contactTestBitMask = ENEMY_MASK
        view.physicsBody?.collisionBitMask = 0

    }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        
        let moveToTopAction = SKAction.moveToTop(position: position, rect: parent.frame, speed: SPEED)
        view.run(SKAction.sequence([moveToTopAction, SKAction.removeFromParent()]))
        
    }
    
    
//    init(){
//        view.name = "player_bullet"
//        // Physics
//        
//        //    }
//    
//    
//    
//    // getter
//    
//    
//    
//    func config(position: CGPoint, parent: SKNode) {
//        self.view.position = position
//        // Actions
//        let moveToTopAction = SKAction.moveToTop(position: position, rect: parent.frame, speed: SPEED)
//        
//        // position.y -> top -> distance / SPEED
//        
//        view.run(SKAction.sequence([moveToTopAction, SKAction.removeFromParent()]))
//        
//        parent.addChild(self.view)  //GameSence.addChild(self.view)
//    }
    
    // contructor
//    init(postion: CGPoint, parent: SKNode) {
        // Configure properties
        
//        view.position = postion
//        view.name = "player_bullet"
        
        // Physics
        
//        view.physicsBody = SKPhysicsBody(rectangleOf: view.size)
//        view.physicsBody?.categoryBitMask = PLAYER_BULLET_MASK
//        view.physicsBody?.contactTestBitMask = ENEMY_MASK
//        view.physicsBody?.collisionBitMask = 0
//        
  
        
        
        // Actions
//        let moveToTopAction = SKAction.moveToTop(position: postion, rect: parent.frame, speed: SPEED)
    
        // position.y -> top -> distance / SPEED
        
//        view.run(SKAction.sequence([moveToTopAction, SKAction.removeFromParent()])) 
//    }
//    
 
//    init(playerNode: SKSpriteNode, parent: SKNode) {
//        let position = playerNode.position.add(x: 0, y: -(playerNode.size.height + self.init(position, parent)))
//    }
    
    }

