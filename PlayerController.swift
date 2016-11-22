//
//  PlayerController.swift
//  Sesson1
//
//  Created by Admin on 11/12/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import SpriteKit

class PlayerController: Controller {
    
    let SHOOT_INTERVAL = 0.3
    var lifePlayer = 5
    var sound = SKAction.playSoundFileNamed("SoundPlayerBullet.wav", waitForCompletion: false)
    
    init() {
        // set view
        super.init(view: SKSpriteNode(texture: PLAYER_TEXTURE))
        view.name = "player"
        view.physicsBody = SKPhysicsBody(rectangleOf: view.size)
        view.physicsBody?.categoryBitMask = PLAYER_MASK
        view.physicsBody?.contactTestBitMask = ENEMY_BULLET_MASK
        view.physicsBody?.collisionBitMask = 0
        
    }
    
    override func config(position: CGPoint, parent: SKNode) {
        super.config(position: position, parent: parent)
        self.configContraints()
        self.configShoot()
        
    }
    
    
    func configContraints() {
        let xRange = SKRange(lowerLimit: 0, upperLimit: parent.frame.width)
        let yRange = SKRange(lowerLimit: 0, upperLimit: parent.frame.height)
        view.constraints = [SKConstraint.positionX(xRange, y: yRange)]
    }
    
    
    func configShoot() {
        let shotAction = SKAction.run{
                let bulletController = PlayerBulletController()
            let startPosition = CGPoint(x: self.position.x, y: self.position.y + (self.height + bulletController.height) * 0.5)
            self.playSound(sound: self.sound)
            bulletController.config(position: startPosition, parent: self.parent)
        }
        
        
        let shootWithDelayAction = SKAction.sequence([shotAction, SKAction.wait(forDuration: SHOOT_INTERVAL)])
        
        view.run(SKAction.repeatForever(shootWithDelayAction))
       
    }
    
    func move(vector: CGVector){
        view.position = view.position.add(vector: vector)
    }
}
