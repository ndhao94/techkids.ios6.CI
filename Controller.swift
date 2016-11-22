//
//  Controller.swift
//  Sesson1
//
//  Created by Admin on 11/12/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import SpriteKit


class Controller {
    
        
    let view: SKSpriteNode
    var parent: SKNode!
    
    
    init(view: SKSpriteNode){
        self.view = view
    }
    
    func randomInRange(lo: Int, hi : Int) -> Int {
        return lo + Int(arc4random_uniform(UInt32(hi - lo + 1)))
    }
    
    func playSound(sound: SKAction){
        view.run(sound)
    }
    

    func config(position: CGPoint, parent: SKNode) {
        self.view.position = position
        self.parent = parent
        parent.addChild(self.view)  //GameSence.addChild(self.view)
    }

    
    var width : CGFloat{
        get{
            return self.view.size.width
        }
    }
    
    var height : CGFloat {
        get{
            return self.view.size.height
        }
    }
    
    var position : CGPoint {
        get{
            return self.view.position
        }
    }
    
    

}
