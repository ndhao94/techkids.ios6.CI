//
//  Constants.swift
//  Sesson1
//
//  Created by Admin on 11/10/16.
//  Copyright © 2016 Techkids. All rights reserved.
//

import SpriteKit

let PLAYER_MASK             = UInt32( 1 << 0 )
let PLAYER_BULLET_MASK      = UInt32( 1 << 1 )
let ENEMY_MASK              = UInt32( 1 << 2 )
let ENEMY_BULLET_MASK       = UInt32( 1 << 3 )

let PLAYER_BULLET_TEXTURE = SKTexture(imageNamed: "bullet")
let ENEMY_BULLET_TEXTURE = SKTexture(imageNamed: "e_bullet")
let PLAYER_TEXTURE = SKTexture(imageNamed: "plane")
let ENEMY_TEXTURE = SKTexture(imageNamed: "e_digonal")
let ENEMY_DIGONAL_TEXTURE = SKTexture(imageNamed: "e_plane")

