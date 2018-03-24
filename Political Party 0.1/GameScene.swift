//
//  GameScene.swift
//  Political Party 0.1
//
//  Created by Patrick Bruce on 3/24/18.
//  Copyright © 2018 Patrick Bruce. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //array of posssible stars
    var stars = ["Blue Star.png", "Red Star.png"]
    //makes some objects into sprite nodes
    var star: Star!
    var scoreLabel: SKLabelNode!
    //sets intitial score to zero as well as the displayed score to the score when it is set
    var score = 0 {
        didSet{
            scoreLabel.text = "\(score)"
        }
    }
    var gameTimer : Timer!
    
//    let starCategory: UInt32 = 0x1 << 1
//    let wallCategory: UInt32 = 0x1 << 0
    
    override func didMove(to view: SKView) {
        
        
        //world boarder
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        //creates the first star
        addStar()
        
        //creates the score board
        scoreLabel = SKLabelNode(text: "0")
        scoreLabel.position = CGPoint(x: 0, y: 0)
        scoreLabel.zPosition = -1
        scoreLabel.fontSize = 170
        scoreLabel.fontColor = UIColor.black
        score = 0
        
        self.addChild(scoreLabel)
        
        //creates a timer for the game that spans the stars at an interval (this will have decreaing function instead of 3 in the future)
        gameTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(addStar), userInfo: nil, repeats: true)
    }
    
    @objc func addStar()
    {
        //adds new stars
        stars = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: stars) as! [String]
        let star = Star(imageNamed: stars[0])
        let randomPos = GKRandomDistribution(lowestValue: -100, highestValue: 100)
        let posX = CGFloat(randomPos.nextInt())
        let posY = CGFloat(randomPos.nextInt())
        star.position = CGPoint(x: posX, y: posY)
        star.physicsBody = SKPhysicsBody(rectangleOf: star.size)
        star.physicsBody?.isDynamic = true
        star.physicsBody?.affectedByGravity = false
        
        self.addChild(star)
        
//        star.physicsBody?.categoryBitMask = starCategory
//        star.physicsBody?.contactTestBitMask = wallCategory
//        star.physicsBody?.collisionBitMask = 0
        
//        let animationDuration: TimeInterval = 1.0
//        var actionArray = [SKAction]()
//        actionArray.append(SKAction.fadeIn(withDuration: animationDuration))
//        actionArray.append(SKAction.fadeOut(withDuration: animationDuration))
//        
//        
//        star.run(SKAction.sequence(actionArray))
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        // Called before each frame is rendered
    }
}
