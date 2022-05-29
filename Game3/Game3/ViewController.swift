//
//  ViewController.swift
//  Game3
//
//  Created by user on 29.05.22.
//

import UIKit
let myCircle = UIView()
class ViewController: UIViewController {
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
    }
    @IBAction func buttonTopTap(_ sender: Any) {
        if myCircle.frame.origin.y > 0 {
            myCircle.frame.origin.y -= 10
        }
    }
    @IBAction func buttonBottonTap(_ sender: Any) {
        if myCircle.frame.origin.y < buttonTop.frame.origin.y - 50 {
            myCircle.frame.origin.y += 10
        }
    }
    @IBAction func buttonRightTap(_ sender: Any) {
        if myCircle.frame.origin.x < view.frame.maxX - myCircle.frame.width{
            myCircle.frame.origin.x += 10
        }
        
    }
    @IBAction func buttonLeftTap(_ sender: Any) {
        if myCircle.frame.origin.x > 0 {
            myCircle.frame.origin.x -= 10
        }
    }
}

