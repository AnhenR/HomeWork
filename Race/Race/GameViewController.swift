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
    
    private var carLeadingAnchor: NSLayoutConstraint?
    private var carTrailingAnchor: NSLayoutConstraint?
    private var carTopAnchor: NSLayoutConstraint?
    private var grayBallTopAnchor: NSLayoutConstraint?
    private var grayBallBottomAnchor: NSLayoutConstraint?
    private var whiteBallTopAnchor: NSLayoutConstraint?
    private var whiteBallBottomAnchor: NSLayoutConstraint?
    
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
    }
    
    private func makeUI() {
        road.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        road.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        road.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        road.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        markup.topAnchor.constraint(equalTo: road.topAnchor).isActive = true
        markup.leadingAnchor.constraint(equalTo: road.leadingAnchor, constant: 147).isActive = true
        markup.trailingAnchor.constraint(equalTo: road.trailingAnchor,constant: -147).isActive = true
        markup.bottomAnchor.constraint(equalTo: road.bottomAnchor).isActive = true
        
        carTopAnchor = car.topAnchor.constraint(equalTo: view.topAnchor, constant: 582)
        carTopAnchor?.isActive = true
        carLeadingAnchor = car.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 220)
        carLeadingAnchor?.isActive = true
        carTrailingAnchor = car.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -65)
        carTrailingAnchor?.isActive = true
        car.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        
        grayBallTopAnchor = grayBall.topAnchor.constraint(equalTo: view.topAnchor)
        grayBallTopAnchor?.isActive = true
        grayBall.leadingAnchor.constraint(equalTo: road.leadingAnchor, constant: 38.5).isActive = true
        grayBall.trailingAnchor.constraint(equalTo: road.trailingAnchor, constant: -205.5).isActive = true
        grayBall.heightAnchor.constraint(equalToConstant: 50).isActive = true
        grayBallBottomAnchor = grayBall.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        grayBallBottomAnchor?.isActive = false
        
        whiteBallTopAnchor = whiteBall.topAnchor.constraint(equalTo: road.topAnchor)
        whiteBallTopAnchor?.isActive = true
        whiteBall.leadingAnchor.constraint(equalTo: road.leadingAnchor, constant: 205.5).isActive = true
        whiteBall.trailingAnchor.constraint(equalTo: road.trailingAnchor, constant: -38.5).isActive = true
        whiteBall.heightAnchor.constraint(equalToConstant: 50).isActive = true
        whiteBallBottomAnchor = whiteBall.bottomAnchor.constraint(equalTo: road.bottomAnchor)
        whiteBallBottomAnchor?.isActive = false
        
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
    }
    
    @objc func didSwipe(sender: UISwipeGestureRecognizer){
        guard let carLeadingAnchor = carLeadingAnchor,
              let carTrailingAnchor = carTrailingAnchor else {
                  return
              }
        UIView.animate(withDuration: 60, delay: 30){
            if sender.direction == .right {
                self.carLeadingAnchor?.isActive = false
                self.carTrailingAnchor?.isActive = false
                self.carLeadingAnchor?.constant += 40
                self.carTrailingAnchor?.constant += 40
                self.carLeadingAnchor?.isActive = true
                self.carTrailingAnchor?.isActive = true
            } else if carLeadingAnchor.constant <= 50 {
                self.performSegue(withIdentifier: "next", sender: self)
           }
            else if sender.direction == .left {
                self.carLeadingAnchor?.isActive = false
                self.carTrailingAnchor?.isActive = false
                self.carLeadingAnchor?.constant -= 40
                self.carTrailingAnchor?.constant -= 40
                self.carLeadingAnchor?.isActive = true
                self.carTrailingAnchor?.isActive = true
            }  else if carTrailingAnchor.constant >= -50 {
                self.performSegue(withIdentifier: "next", sender: self)
            }
        }
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
    
    private func objecеСollision() {
        guard let grayBallBottomAnchor = grayBallBottomAnchor,
              let whiteBallBottomAnchor = whiteBallBottomAnchor,
              let carTopAnchor = carTopAnchor else {
                  return
              }
    }
}



