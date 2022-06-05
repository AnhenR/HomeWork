//
//  GameSquaresViewController.swift
//  Game2
//
//  Created by user on 5.06.22.
//

import Foundation
import UIKit
enum Colors: CaseIterable {
    case red
    case blue
    case magenta
    case cyan
    case yellow
    case gray
    var name: String {
        switch self {
        case .red:
            return "red"
        case .blue:
            return "blue"
        case .magenta:
            return "magenta"
        case .cyan:
            return "cyan"
        case .yellow:
            return "yellow"
        case .gray:
            return "gray"
        }
    }
    var color1: UIColor {
        switch self {
        case .red:
            return.red
        case .blue:
            return.blue
        case .magenta:
            return.magenta
        case .cyan:
            return.cyan
        case .yellow:
            return.yellow
        case .gray:
            return.gray
        }
    }
}

class GameSquaresViewController: UIViewController {
    
    private  let tapView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapView.backgroundColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tapView.frame.size = .init(width: 100, height: 100)
        tapView.center = .init(x: view.frame.midX, y: view.frame.midY)
        view.addSubview(tapView)
        tapView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    @objc func didTap(){
        for x in 0...Int((view.frame.maxY * view.frame.maxX)/100){
            let square = UILabel()
            let color = Colors.allCases.randomElement()
            square.text = color?.name
            square.backgroundColor = color?.color1
            square.textAlignment = .center
            square.textColor = .black
            square.frame.size = .init(width: 100, height: 100)
            if Int((x / Int(view.frame.maxX))*100) < Int(view.frame.maxX){
                square.frame.origin = .init(x: Int((x / Int(view.frame.maxX))*100) , y: Int((x % Int(view.frame.maxX))*100))
                view.addSubview(square)
            }
        }
    }
}




