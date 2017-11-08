//
//  BallView.swift
//  Activity6
//
//  Created by JEFFERSON RYLEE ESPIRITU on 08/11/2017.
//  Copyright © 2017 iOS Arnesfield. All rights reserved.
//

import UIKit

class BallView: UIView {

    var lineStroke: CGFloat = 8 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var color: UIColor = UIColor.red {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let radius = min(bounds.size.width, bounds.size.height) / 2 - lineStroke / 2
        let ball = UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: radius,
            startAngle: 0,
            endAngle: CGFloat(2 * M_PI),
            clockwise: true)
        
        ball.lineWidth = lineStroke
        UIColor.yellow.setStroke()
        UIColor.green.setFill()
        ball.stroke()
        ball.fill()
        
        let stitch1 = UIBezierPath()
        stitch1.addArc(
            withCenter: CGPoint(x: bounds.midX - radius, y: bounds.midY - radius),
            radius: radius,
            startAngle: 0,
            endAngle: CGFloat(M_PI / 2),
            clockwise: true)
        stitch1.lineWidth = lineStroke
        stitch1.stroke()
        
        let stitch2 = UIBezierPath()
        stitch2.addArc(
            withCenter: CGPoint(x: bounds.midX + radius, y: bounds.midY + radius),
            radius: radius,
            startAngle: 0,
            endAngle: CGFloat(M_PI * 1.5),
            clockwise: true)
        stitch2.lineWidth = lineStroke
        stitch2.stroke()
        
    }
    
    func containsPoints(_ point: CGPoint) -> Bool {
        let radius = min(bounds.size.width, bounds.size.height) / 2 - lineStroke / 2
        let ball = UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: radius,
            startAngle: 0,
            endAngle: CGFloat(2 * M_PI),
            clockwise: true)
        return ball.contains(point)
    }

}
