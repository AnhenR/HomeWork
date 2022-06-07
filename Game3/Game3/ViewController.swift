//
//  ViewController.swift
//  Game3
//
//  Created by user on 29.05.22.
//

import UIKit
private let myCircle = UIView()

enum DirectionOfTravel {
    case top
    case bottom
    case right
    case left
}

class ViewController: UIViewController {
    
    @IBOutlet weak var lableDirection: UILabel!
    @IBOutlet weak var buttonTop: UIButton!
    @IBOutlet weak var buttonBottom: UIButton!
    @IBOutlet weak var buttonRight: UIButton!
    @IBOutlet weak var buttonLeft: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonTop.layer.cornerRadius = 10
        buttonBottom.layer.cornerRadius = 10
        buttonRight.layer.cornerRadius = 10
        buttonLeft.layer.cornerRadius = 10
        myCircle.backgroundColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myCircle.frame.size = .init(width: 40, height: 40)
        myCircle.center = .init(x: view.frame.midX, y: view.frame.midY)
        myCircle.layer.cornerRadius = myCircle.frame.height/2
        view.addSubview(myCircle)
        let leftGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        leftGesture.direction = .left
        let rightGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        rightGesture.direction = .right
        let upGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        upGesture.direction = .up
        let downGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        downGesture.direction = .down
        myCircle.addGestureRecognizer(leftGesture)
        myCircle.addGestureRecognizer(rightGesture)
        myCircle.addGestureRecognizer(upGesture)
        myCircle.addGestureRecognizer(downGesture)
    }
    @objc func didSwipe(sender: UISwipeGestureRecognizer){
        var circle = myCircle
        UIView.animate(withDuration: 1.0){
            if sender.direction == .right {
                if circle.frame.origin.x < self.view.frame.maxX - circle.frame.width - 10 {
                    circle.frame = CGRect(x: circle.frame.origin.x + circle.frame.size.width, y: circle.frame.origin.y, width: circle.frame.size.width, height: circle.frame.size.height)
                }
            }
            else if sender.direction == .left {
                if circle.frame.origin.x > 0 + 7 {
                    circle.frame = CGRect(x: circle.frame.origin.x - circle.frame.size.width, y: circle.frame.origin.y, width: circle.frame.size.width, height: circle.frame.size.height)
                }
            }
            else if sender.direction == .up {
                if circle.frame.origin.y > 0 + 8 {
                    circle.frame = CGRect(x: circle.frame.origin.x, y: circle.frame.origin.y - circle.frame.size.height, width: circle.frame.size.width, height: circle.frame.size.height)
                }
            }
            else if sender.direction == .down {
                if circle.frame.origin.y < self.buttonTop.frame.origin.y - 50 {
                    circle.frame = CGRect(x: circle.frame.origin.x, y: circle.frame.origin.y + circle.frame.size.height, width: circle.frame.size.width, height: circle.frame.size.height)
                }
            }
        }
        print("Direction:\(sender.direction)")
    }
    
    @IBAction func buttonTopTap(_ sender: Any) {
        choiceOfDirection(direction: .top)
    }
    
    @IBAction func buttonBottonTap(_ sender: Any) {
        choiceOfDirection(direction: .bottom)
    }
    
    @IBAction func buttonRightTap(_ sender: Any) {
        choiceOfDirection(direction: .right)
    }
    
    @IBAction func buttonLeftTap(_ sender: Any) {
        choiceOfDirection(direction: .left)
    }
    
    func choiceOfDirection(direction: DirectionOfTravel){
        switch direction {
        case .top:
            if myCircle.frame.origin.y > 0 + 8 {
                myCircle.frame.origin.y -= 10
                lableDirection.text = "Верх"
            }
            else {
                lableDirection.text = "Нет"
            }
        case .bottom:
            if myCircle.frame.origin.y < buttonTop.frame.origin.y - 50 {
                myCircle.frame.origin.y += 10
                lableDirection.text = "Низ"
            }
            else {
                lableDirection.text = "Нет"
            }
        case .right:
            if myCircle.frame.origin.x < view.frame.maxX - myCircle.frame.width - 7 {
                myCircle.frame.origin.x += 10
                lableDirection.text = "Право"
            }
            else {
                lableDirection.text = "Нет"
            }
        case .left:
            if myCircle.frame.origin.x > 0 + 7 {
                myCircle.frame.origin.x -= 10
                lableDirection.text = "Лево"
            }
            else {
                lableDirection.text = "Нет"
            }
        }
    }
}

