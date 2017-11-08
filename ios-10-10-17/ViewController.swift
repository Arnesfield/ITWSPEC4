//
//  ViewController.swift
//  ios-10-10-17
//
//  Created by JEFFERSON RYLEE ESPIRITU on 10/10/2017.
//  Copyright © 2017 iOS Arnesfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ball = BallView()
    
    @IBAction func tapHandler(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: self.view)
        UIView.animate(withDuration: 1.0) {
            () -> Void in
            self.ball.center = point
        }
    }
    
    var panCenterOffSet = CGPoint.zero
    var isIgnorePan = false
    
    @IBAction func panHandler(_ sender: UIPanGestureRecognizer) {
        switch (sender.state) {
        case .began:
            let point = sender.location(in: ball)
            if (ball.containsPoints(point)) {
                panCenterOffSet.x = ball.bounds.midX - point.x
                panCenterOffSet.y = ball.bounds.midY - point.y
            }
            else {
                isIgnorePan = true
            }
        case .changed:
            if !isIgnorePan {
                let panLocation = sender.location(in: self.view)
                ball.center = CGPoint(x: panLocation.x + panCenterOffSet.x, y: panLocation.y + panCenterOffSet.y)
            }
        case .ended:
            isIgnorePan = false
        default: break
        }
    }
    @IBAction func pinchHandler(_ sender: UIPinchGestureRecognizer) {
        switch (sender.state) {
        case .changed:
            ball.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        case .ended:
            let newBallRect = ball.bounds.applying(ball.transform)
            ball.bounds = newBallRect
            ball.setNeedsDisplay()
        default: break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ball.frame = CGRect(
            x: view.bounds.midX - 50,
            y: view.bounds.midY - 50,
            width: 100,
            height: 100)
        ball.backgroundColor = UIColor.clear
        ball.isOpaque = true
        self.view.addSubview(ball)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

