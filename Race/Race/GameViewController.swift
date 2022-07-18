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
    
    private var isFirstLaunch = true
    
    private var grayTimer: Timer?
    private var whiteTimer: Timer?
    private var bushTimer: Timer?
    private var colissionTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        configureUI()
        makeUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateBushBottom()
        animateWhiteBottom()
        animateGrayBottom()
        objectColission()
        //        creaRoadVerticalTimer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard isFirstLaunch else { return }
        carLeadingAnchor = car.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat((roadLeadingAnchor?.constant ?? 50) + 100))
        carLeadingAnchor?.isActive = true
        carTrailingAnchor = car.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: CGFloat((roadTrailingAnchor?.constant ?? 50) + 50))
        carTrailingAnchor?.isActive = true
        isFirstLaunch = false
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
        bush1.widthAnchor.constraint(equalToConstant: 45).isActive = true
        bush1.heightAnchor.constraint(equalToConstant: 70).isActive = true
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
        let carColor = UserDefaults.standard.value(forKey: .car) as? String
        switch carColor {
        case "car1" :
            car.image = .init(named: "car")
        case "car2" :
            car.image = .init(named: "secondCar")
        default:
            break
        }
        car.translatesAutoresizingMaskIntoConstraints = false
        car.contentMode = .scaleAspectFit
        
        road.addSubview(grayBall)
        grayBall.translatesAutoresizingMaskIntoConstraints = false
        let grayColor = UserDefaults.standard.value(forKey: .ball1) as? String
        switch grayColor{
        case "grayBall1" :
            grayBall.backgroundColor = .gray
            grayBall.layer.cornerRadius = 50
        case "grayBall2" :
            grayBall.backgroundColor = .yellow
            grayBall.layer.cornerRadius = 20
        default:
            break
        }
        
        
        road.addSubview(whiteBall)
        whiteBall.translatesAutoresizingMaskIntoConstraints = false
        let whiteColor = UserDefaults.standard.value(forKey: .ball2) as? String
        switch whiteColor{
        case "whiteBall1" :
            whiteBall.backgroundColor = .white
            whiteBall.layer.cornerRadius = 50
        case "whiteBall2" :
            whiteBall.backgroundColor = .green
            whiteBall.layer.cornerRadius = 20
        default:
            break
        }
        
        view.addSubview(bush1)
        bush1.image = .init(named: "bush")
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
        self.carLeadingAnchor?.isActive = true
        self.carTrailingAnchor?.constant += 40
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
    
    private func creaRoadVerticalTimer() {
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { [weak self] timer in
            guard let self = self else { return }
            self.animateRoad()
        }
    }
    
    private func animateRoad() {
        roadLeadingAnchor?.isActive = false
        roadTrailingAnchor?.isActive = false
        roadLeadingAnchor?.constant += 10
        roadTrailingAnchor?.constant += 10
        roadLeadingAnchor?.isActive = true
        roadTrailingAnchor?.isActive = true
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func animateGrayBottom() {
        self.grayTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            self.grayBallTopAnchor?.isActive = false
            self.grayBallBottomAnchor?.isActive = true
            UIView.animate(withDuration: 10.0, delay: 0) {
                self.view.layoutIfNeeded()
            } completion: {_ in
                self.grayBallTopAnchor?.isActive = true
                self.grayBallBottomAnchor?.isActive = false
            }
        }
    }
    
    private func animateWhiteBottom() {
        self.whiteTimer = Timer.scheduledTimer(withTimeInterval: 13.0, repeats: true) { _ in
            self.whiteBallTopAnchor?.isActive = false
            self.whiteBallBottomAnchor?.isActive = true
            UIView.animate(withDuration: 10.0, delay: 0) {
                self.view.layoutIfNeeded()
            } completion: {_ in
                self.whiteBallTopAnchor?.isActive = true
                self.whiteBallBottomAnchor?.isActive = false
            }
        }
    }
    
    private func animateBushBottom() {
        self.bushTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.bush1TopAnchor?.isActive = false
            self.bush1BottomAnchor?.isActive = true
            UIView.animate(withDuration: 15.0, delay: 0) {
                self.view.layoutIfNeeded()
            } completion: {_ in
                self.bush1TopAnchor?.isActive = true
                self.bush1BottomAnchor?.isActive = false
            }
        }
    }
    
    private func objectColission() {
        colissionTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            let grayCrash = self.grayBall.layer.presentation()!.frame.intersects(self.car.layer.presentation()!.frame)
            let whiteCrash = self.whiteBall.layer.presentation()!.frame.intersects(self.car.layer.presentation()!.frame)
            if grayCrash || whiteCrash {
                self.colissionTimer?.invalidate()
                self.grayTimer?.invalidate()
                self.bushTimer?.invalidate()
                self.whiteTimer?.invalidate()
                self.bush1TopAnchor?.isActive = true
                self.bush1BottomAnchor?.isActive = false
                self.grayBallTopAnchor?.isActive = true
                self.grayBallBottomAnchor?.isActive = false
                self.whiteBallTopAnchor?.isActive = true
                self.whiteBallBottomAnchor?.isActive = false
                self.view.layoutIfNeeded()
            }
        })
    }
}

