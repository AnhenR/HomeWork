//
//  GameTap.swift
//  Game for cats
//
//  Created by user on 8.06.22.
//

import Foundation
import UIKit

private let ball = UIView()

class GameTap: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        ball.backgroundColor = .green
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ball.frame.size = .init(width: 60, height: 60)
        ball.layer.cornerRadius = ball.frame.height/2
        ball.center = .init(x: view.frame.midX, y: view.frame.midY)
        view.addSubview(ball)
        let singleTapGestureRecognizerView = UITapGestureRecognizer(target: self, action:#selector(handleSingleTapGestureView))
        view.addGestureRecognizer(singleTapGestureRecognizerView)
        let singleTapGestureRecognizerBall = UITapGestureRecognizer(target: self, action:#selector(handleTapGestureBall))
        singleTapGestureRecognizerBall.numberOfTapsRequired = 1
        ball.addGestureRecognizer(singleTapGestureRecognizerBall)
        let doubleTapGestureRecognizerBall = UITapGestureRecognizer(target: self, action:#selector(handleTapGestureBall))
        doubleTapGestureRecognizerBall.numberOfTapsRequired = 2
        ball.addGestureRecognizer(doubleTapGestureRecognizerBall)
        
    }
    
    @objc func handleSingleTapGestureView(tapView: UITapGestureRecognizer) {
        UIView.animate(withDuration: 1.0){
            ball.frame = CGRect(x: tapView.location(in: self.view).x - ball.frame.size.height / 2, y: tapView.location(in: self.view).y - ball.frame.size.width / 2 , width: ball.frame.size.width, height:ball.frame.size.height)
            ball.isHidden = false
            self.view.addSubview(ball)
        }
    }
    @objc func handleTapGestureBall(tapBall: UITapGestureRecognizer) {
        if tapBall.numberOfTapsRequired == 2 {
            ball.isHidden = true
        }
        else if tapBall.numberOfTapsRequired == 1 {
            ball.backgroundColor = .red
        }
    }
}
