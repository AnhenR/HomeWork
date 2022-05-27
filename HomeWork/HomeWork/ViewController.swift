//
//  ViewController.swift
//  HomeWork
//
//  Created by user on 6.05.22.
//

import UIKit
let game = UIView()
class ViewController: UIViewController {
    func rundomColor() -> UIColor{
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        game.backgroundColor = .red
        }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        game.frame.size = .init(width: 100, height: 100)
        game.center = .init(x: view.frame.midX, y: view.frame.midY)
        game.layer.cornerRadius = game.frame.height/2
        view.addSubview(game)
        game.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
}
    @objc func didTap(){
        game.frame.origin = .init(x: .random(in: 0...view.frame.maxX - game.frame.width), y: .random(in: 0...view.frame.maxY - game.frame.height))
        game.backgroundColor = rundomColor()
    }


}
