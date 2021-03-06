//
//  EnemyBulletDigonalController.swift
//  Sesson1
//
//  Created by Admin on 11/16/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import SpriteKit

class EnemyBulletDigonalController: Controller{
    
    
    let SPEED : CGFloat = 100
    
    init() {
        super.init(view: SKSpriteNode(texture: ENEMY_BULLET_TEXTURE))
        view.name = "enemy_bullet"
        view.physicsBody = SKPhysicsBody(texture: ENEMY_BULLET_TEXTURE, size: view.size)
        view.physicsBody?.categoryBitMask = ENEMY_BULLET_MASK
        view.physicsBody?.contactTestBitMask = PLAYER_MASK
        view.physicsBody?.collisionBitMask = 0
        
    }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        
        let moveLeftToRight = SKAction.moveLeftToRight(position: position, rect: parent.frame, duration: 2)
        view.run(SKAction.sequence([moveLeftToRight, SKAction.removeFromParent()]))
    }
}
