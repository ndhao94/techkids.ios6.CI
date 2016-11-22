import SpriteKit
import GameplayKit



class GameScene: SKScene, SKPhysicsContactDelegate{
    
    
    let playerController = PlayerController()
    
    override func didMove(to view: SKView) {
        let soundBackGround = SKAction.playSoundFileNamed("BackGroundMusic.mp3", waitForCompletion: false)
        run(soundBackGround)
        addBackground()
        configPhysics()
        let playerPosition = CGPoint(x: self.size.width/2, y: playerController.height/2 )
        playerController.config(position: playerPosition, parent: self)
        addEnemy()
        addEnemyDiagonalToRight()  

        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(GameScene.addEnemy), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(GameScene.addEnemyDiagonalToRight), userInfo: nil, repeats: true)
        
    }
    
    func randomInRange(lo: Int, hi : Int) -> Int {
        return lo + Int(arc4random_uniform(UInt32(hi - lo + 1)))
    }
    
    
    
    func addEnemy(){
        let enemyController = EnemyController()
        let randomX = randomInRange(lo: 0, hi: Int(self.size.width))
        enemyController.config(position: CGPoint(x: randomX, y: Int(self.size.height)) , parent: self)
    }
    
    func addEnemyDiagonalToRight(){
        let enemyDiagonalRightController = EnemyDiagonalController()
        let randomY = randomInRange(lo: Int(self.size.height / 2), hi: Int(self.size.height))
        let moveAction = SKAction.moveLeftToRight(position: CGPoint(x: 0, y: Int(randomY)), rect: self.frame, duration: 3)
        enemyDiagonalRightController.config(position: CGPoint(x: 0, y: Int(randomY)), parent: self)
        print("Di sai roi")
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.location(in: self)
            let previousLocation = touch.previousLocation(in: self)
            
            let movementVector = CGVector(dx: location.x - previousLocation.x, dy: location.y - previousLocation.y)
            playerController.move(vector: movementVector)
        }
        
        if playerController.lifePlayer <= 0 {
            gameOver()
        }

    }
    
    func configPhysics(){
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        if (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask)
            == (ENEMY_BULLET_MASK | PLAYER_MASK) {
            
            let soundHitPlayer = SKAction.playSoundFileNamed("HitPlayer.wav", waitForCompletion: false)
            self.run(soundHitPlayer)
            // Enemy Bullet vs Player
            playerController.lifePlayer = playerController.lifePlayer - 1
            if playerController.lifePlayer == 0{
                let soundHitPlayerGameOver = SKAction.playSoundFileNamed("HitPlayerGameOver.wav", waitForCompletion: false)
                self.run(soundHitPlayerGameOver)
            nodeA?.removeFromParent()
            nodeB?.removeFromParent()
            }
        }
        
        if (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask)
            == (ENEMY_MASK | PLAYER_BULLET_MASK) {
            
            let sound = SKAction.playSoundFileNamed("HitEnemy.wav", waitForCompletion: false)
            self.run(sound)
            // Enemy vs Player Bullet
            nodeA?.removeFromParent()
            nodeB?.removeFromParent()
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        
    }
    
    func gameOver(){
        self.removeAllChildren()
        self.removeAllActions()
        self.removeFromParent()
        let overScene = OverScene(size: self.size)
        overScene.scaleMode = scaleMode
        self.view?.presentScene(overScene, transition: SKTransition.fade(withDuration: 2))
    }


    func addBackground(){
        let background = SKSpriteNode(imageNamed: "background")
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        
        self.addChild(background)
    }
    
    

    
}
