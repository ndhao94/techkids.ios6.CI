//
//  EnemyController.swift
//  Sesson1
//
//  Created by Admin on 11/12/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import SpriteKit

class EnemyController: Controller{
    
    let SPEED: CGFloat = 50
    let SHOOT_INTERVAL: Double = 2
    var sound = SKAction.playSoundFileNamed("SoundEnemyBullet.wav", waitForCompletion: false)
    init() {
        super.init(view: SKSpriteNode(texture: ENEMY_DIGONAL_TEXTURE))
        view.name = "enemy"
        view.physicsBody = SKPhysicsBody(rectangleOf: view.size)
        view.physicsBody?.categoryBitMask = ENEMY_MASK
        view.physicsBody?.contactTestBitMask = PLAYER_BULLET_MASK
        view.physicsBody?.collisionBitMask = 0
    }
    
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        configMove()
        configShoot()
    }
    
    func configMove() {
        let moveToBottomAction = SKAction.moveToBottom(position: self.position, speed: SPEED)
        self.view.run(SKAction.sequence([moveToBottomAction, SKAction.removeFromParent()]))
    }
    
    func configShoot() -> Void {
        let shotAction = SKAction.run {
            let enemyBulletController = EnemyBulletController()
            let startPosition = CGPoint(x: self.position.x, y: self.position.y - (self.height + enemyBulletController.height) * 0.5)
            self.playSound(sound: self.sound)
            enemyBulletController.config(position: startPosition, parent: self.parent)
        }
        
        let shotWithDelayAction = SKAction.sequence([shotAction, SKAction.wait(forDuration: self.SHOOT_INTERVAL)])
        self.view.run(SKAction.repeatForever(shotWithDelayAction))
    }
    
}
