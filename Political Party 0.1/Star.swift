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
    
    var growing = true;
    var isDragging = false
    var gameTimer : Timer!
    var pulseSize = 75.0
    
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
        if self.position.y < 505 && self.position.y > -505
        {
        let touch = touches.first
        guard let location = touch?.location(in: self.parent!) else {
            return
        }
        
        position = location
        }
    }
    
//    @objc func pulse() {
//        gameTimer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(pulse), userInfo: nil, repeats: true)
//
//        if growing
//        {pulseSize += 1}
//        else
//        {pulseSize -= 1}
//        
//        if pulseSize >= 100
//        {growing = false}
//        if pulseSize <= 50
//        {growing = true}
//        
//        self.scale(to: CGSize(width: pulseSize, height: pulseSize))
//        
//    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        isUserInteractionEnabled = true
    }

    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
