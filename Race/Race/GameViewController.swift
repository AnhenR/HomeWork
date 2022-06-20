//
//  GameViewController.swift
//  Race
//
//  Created by user on 6.06.22.
//

import Foundation
import UIKit

class GameViewController: UIViewController {
    
    private let road = UIView()
    private let markup = UIView()
    private let car = UIImageView()
    private let rightButton = UIButton()
    private let leftButton = UIButton()
    private let grayBall = UIView()
    private let whiteBall = UIView()
    private let bush1 = UIImageView()
    private let bush2 = UIImageView()
    
    private var carLeadingAnchor: NSLayoutConstraint?
    private var carTrailingAnchor: NSLayoutConstraint?
    private var carTopAnchor: NSLayoutConstraint?
    private var grayBallTopAnchor: NSLayoutConstraint?
    private var grayBallBottomAnchor: NSLayoutConstraint?
    private var whiteBallTopAnchor: NSLayoutConstraint?
    private var whiteBallBottomAnchor: NSLayoutConstraint?
    private var bush1TopAnchor: NSLayoutConstraint?
    private var bush1BottomAnchor: NSLayoutConstraint?
    private var roadLeadingAnchor: NSLayoutConstraint?
    private var roadTrailingAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        configureUI()
        makeUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createGrayVerticalTimer()
        createWhiteVerticalTimer()
        createBushVerticalTimer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       carLeadingAnchor = car.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat((roadLeadingAnchor?.constant ?? 50) + 100))
       carLeadingAnchor?.isActive = true
       carTrailingAnchor = car.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: CGFloat((roadTrailingAnchor?.constant ?? 50) + 50))
       carTrailingAnchor?.isActive = true
        
    }
    
    private func makeUI() {
        road.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        roadLeadingAnchor = road.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
        roadLeadingAnchor?.isActive = true
        roadTrailingAnchor = road.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        roadTrailingAnchor?.isActive = true
        road.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        markup.topAnchor.constraint(equalTo: road.topAnchor).isActive = true
        markup.leadingAnchor.constraint(equalTo: road.leadingAnchor, constant: 147).isActive = true
        markup.trailingAnchor.constraint(equalTo: road.trailingAnchor,constant: -147).isActive = true
        markup.bottomAnchor.constraint(equalTo: road.bottomAnchor).isActive = true
        
        carTopAnchor = car.topAnchor.constraint(equalTo: view.topAnchor, constant: 542)
        carTopAnchor?.isActive = true
        car.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        
        grayBallTopAnchor = grayBall.topAnchor.constraint(equalTo: view.topAnchor)
        grayBallTopAnchor?.isActive = true
        grayBall.leadingAnchor.constraint(equalTo: road.leadingAnchor, constant: 38.5).isActive = true
        grayBall.trailingAnchor.constraint(equalTo: road.trailingAnchor, constant: -205.5).isActive = true
        grayBall.heightAnchor.constraint(equalToConstant: 50).isActive = true
        grayBallBottomAnchor = grayBall.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50)
        grayBallBottomAnchor?.isActive = false
        
        whiteBallTopAnchor = whiteBall.topAnchor.constraint(equalTo: road.topAnchor)
        whiteBallTopAnchor?.isActive = true
        whiteBall.leadingAnchor.constraint(equalTo: road.leadingAnchor, constant: 205.5).isActive = true
        whiteBall.trailingAnchor.constraint(equalTo: road.trailingAnchor, constant: -38.5).isActive = true
        whiteBall.heightAnchor.constraint(equalToConstant: 50).isActive = true
        whiteBallBottomAnchor = whiteBall.bottomAnchor.constraint(equalTo: road.bottomAnchor, constant: 50)
        whiteBallBottomAnchor?.isActive = false
        
        bush1TopAnchor = bush1.topAnchor.constraint(equalTo: view.topAnchor)
        bush1TopAnchor?.isActive = true
        bush1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        bush1.widthAnchor.constraint(equalToConstant: 25).isActive = true
        bush1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bush1BottomAnchor = bush1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50)
        bush1BottomAnchor?.isActive = false
        
        let leftGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        leftGesture.direction = .left
        view.addGestureRecognizer(leftGesture)
        let rightGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        rightGesture.direction = .right
        view.addGestureRecognizer(rightGesture)
    }
    
    private func configureUI(){
        road.backgroundColor = .darkGray
        road.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(road)
        
        markup.backgroundColor = .white
        markup.translatesAutoresizingMaskIntoConstraints = false
        road.addSubview(markup)
        
        view.addSubview(car)
        car.image = .init(named: "car")
        car.translatesAutoresizingMaskIntoConstraints = false
        car.contentMode = .scaleAspectFit
        
        grayBall.backgroundColor = .gray
        grayBall.translatesAutoresizingMaskIntoConstraints = false
        road.addSubview(grayBall)
        grayBall.layer.cornerRadius = 50
        
        whiteBall.backgroundColor = .white
        whiteBall.translatesAutoresizingMaskIntoConstraints = false
        road.addSubview(whiteBall)
        whiteBall.layer.cornerRadius = 50
        
        view.addSubview(bush1)
        bush1.image = .init(named: "bush1")
        bush1.translatesAutoresizingMaskIntoConstraints = false
        bush1.contentMode = .scaleAspectFit
    }
    
    @objc func didSwipe(sender: UISwipeGestureRecognizer){
        if sender.direction == .right {
            self.leftTurn()
        } else if sender.direction == .left {
            self.rightTurn()
        }
    }
    
    private func leftTurn() {
        
        self.carLeadingAnchor?.isActive = false
        self.carTrailingAnchor?.isActive = false
        self.carLeadingAnchor?.constant += 40
        self.carTrailingAnchor?.constant += 40
        self.carLeadingAnchor?.isActive = true
        self.carTrailingAnchor?.isActive = true
    }
    
    private func rightTurn() {
        self.carLeadingAnchor?.isActive = false
        self.carTrailingAnchor?.isActive = false
        self.carLeadingAnchor?.constant -= 40
        self.carTrailingAnchor?.constant -= 40
        self.carLeadingAnchor?.isActive = true
        self.carTrailingAnchor?.isActive = true
    }
    
    private func createGrayVerticalTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.animateGrayBottom()
        }
    }
    
    private func createWhiteVerticalTimer() {
        Timer.scheduledTimer(withTimeInterval: 15.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.animateWhiteBottom()
        }
    }
    
    private func createBushVerticalTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.animateBushBottom()
        }
    }
    
    private func animateGrayBottom() {
        grayBallTopAnchor?.isActive = false
        grayBallBottomAnchor?.isActive = true
        UIView.animate(withDuration: 10.0, delay: 0, options: [.repeat]) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func animateWhiteBottom() {
        whiteBallTopAnchor?.isActive = false
        whiteBallBottomAnchor?.isActive = true
        UIView.animate(withDuration: 10.0, delay: 0, options: [.repeat]) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func animateBushBottom() {
        bush1TopAnchor?.isActive = false
        bush1BottomAnchor?.isActive = true
        UIView.animate(withDuration: 15.0, delay: 0, options: [.repeat]) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func objecеСollision() {
        guard let grayBallBottomAnchor = grayBallBottomAnchor,
              let whiteBallBottomAnchor = whiteBallBottomAnchor,
              let carTopAnchor = carTopAnchor else {
                  return
              }
    }
}



