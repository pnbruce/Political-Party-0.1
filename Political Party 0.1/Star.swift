//
//  Star.swift
//  Political Party 0.1
//
//  Created by Patrick Bruce on 3/24/18.
//  Copyright © 2018 Patrick Bruce. All rights reserved.
//
import UIKit
import SpriteKit
import UIKit

open class Star: SKSpriteNode {
    
    var isDragging = false
    var gameTimer : Timer!
    
    func endDrag() {
        isDragging = false
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {

            isDragging = true

    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        endDrag()
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        //check to see if a star can be moved. 
        if self.position.y < 505 && self.position.y > -505
        {
        let touch = touches.first
        guard let location = touch?.location(in: self.parent!) else {
            return
        }
        
        position = location
        }
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        isUserInteractionEnabled = true
    }

    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
