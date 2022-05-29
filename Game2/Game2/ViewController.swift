//
//  ViewController.swift
//  Game2
//
//  Created by user on 29.05.22.
//

import UIKit
let tapView = UIView()
class ViewController: UIViewController {
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
        for x in 0...Int(view.frame.maxX) {
            for y in 0...Int(view.frame.maxY){
                var sq = UIView()
                sq.frame.size = .init(width: 1, height: 1)
                sq.frame.origin = .init(x: x, y: y)
                sq.backgroundColor = randomColor()
                view.addSubview(sq)
            }
        }
        
    }
}




