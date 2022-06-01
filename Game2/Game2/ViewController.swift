//
//  ViewController.swift
//  Game2
//
//  Created by user on 29.05.22.
//

import UIKit
enum Colors: CaseIterable {
    case red
    case blue
    case magenta
    case cyan
    case yellow
    case gray
}

class ViewController: UIViewController {
    
    private  let tapView = UIView()
//    private let colorArray:[UIColor] = [.red , .blue , .magenta , .cyan , .yellow , .gray]
   
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
            var square = UILabel()
            var color = Colors.allCases.randomElement()
                            switch color {
                            case .blue:
                                square.backgroundColor = .blue
                                square.text = "blue"
                            case .red:
                                square.backgroundColor = .red
                                square.text = "red"
                            case .magenta:
                                square.backgroundColor = .magenta
                                square.text = "magenta"
                            case .cyan:
                                square.backgroundColor = .cyan
                                square.text = "cyan"
                            case .yellow:
                                square.backgroundColor = .yellow
                                square.text = "yellow"
                            case .gray:
                                square.backgroundColor = .gray
                                square.text = "gray"
                            case .none:
                                square.text = "No"
                            }
//            square.backgroundColor = color
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
//if square.backgroundColor == .gray {
//    square.text = "gray"
//}
//else if square.backgroundColor == .red {
//    square.text = "red"
//}
//else if square.backgroundColor == .yellow {
//    square.text = "yellow"
//}
//else if square.backgroundColor == .cyan {
//    square.text = "cyan"
//}
//else if square.backgroundColor == .magenta {
//    square.text = "magenta"
//}
//else if square.backgroundColor == .blue {
//    square.text = "blue"
//}



