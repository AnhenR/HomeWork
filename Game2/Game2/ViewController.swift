//
//  ViewController.swift
//  Game2
//
//  Created by user on 29.05.22.
//

import UIKit
class ViewController: UIViewController {
    let tapView = UIView()
    func randomColor() -> UIColor{
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tapView.backgroundColor = .red
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tapView.frame.size = .init(width: 30, height: 30)
        tapView.center = .init(x: view.frame.midX, y: view.frame.midY)
        view.addSubview(tapView)
        tapView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    @objc func didTap(){
//        for x in 0...Int(view.frame.maxX/10) {
//            for y in 0...Int(view.frame.maxY/10) {
//                var sq = UIView()
//                sq.frame.size = .init(width: 10, height: 10)
//                sq.frame.origin = .init(x: x * 10, y: y * 10)
//                sq.backgroundColor = randomColor()
//                view.addSubview(sq)
//            }
//        }
        
        for x in 0...Int((view.frame.maxY * view.frame.maxX)/10) {
            var sq1 = UIView()
            sq1.backgroundColor = randomColor()
            sq1.frame.size = .init(width: 10, height: 10)
            sq1.frame.origin = .init(x: Int((x / Int(view.frame.maxX))*10) , y: Int((x % Int(view.frame.maxX))*10))
            view.addSubview(sq1)
        }
    }
}




