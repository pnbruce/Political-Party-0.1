//
//  DragNode.swift
//  Drag and Drop
//
//  Created by mitchell hudson on 2/20/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//
import UIKit
import SpriteKit

open class Star: SKSpriteNode {
    
    var isDragging = false
    
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
        let touch = touches.first
        guard let location = touch?.location(in: self.parent!) else {
            return
        }
        
        position = location
    }
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        isUserInteractionEnabled = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
