//
//  GamePan.swift
//  GameWithPan
//
//  Created by user on 8.06.22.
//

import Foundation
import UIKit

private var ball = UIView()

class GamePan: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ball.backgroundColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ball.frame.size = .init(width: 60, height: 60)
        ball.layer.cornerRadius = ball.frame.height/2
        ball.center = .init(x: view.frame.midX, y: view.frame.midY)
        view.addSubview(ball)
        let panBall = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        ball.addGestureRecognizer(panBall)
    }
    
    @objc func handlePanGesture (panBall: UIPanGestureRecognizer){
        switch panBall.state {
        @unknown default :
            ball.frame = CGRect(x: panBall.location(in: view).x - ball.frame.size.height / 2, y: panBall.location(in: view).y - ball.frame.size.width / 2 , width: ball.frame.size.width, height:ball.frame.size.height)
        }
    }
}
