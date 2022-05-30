//
//  ViewController.swift
//  Game2
//
//  Created by user on 29.05.22.
//

import UIKit

class ViewController: UIViewController {
    
    private  let tapView = UIView()
    private let colorArray:[UIColor] = [.red , .blue , .magenta , .cyan , .yellow , .gray]
   
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
        for x in 0...Int((view.frame.maxY * view.frame.maxX)/100){
            let square = UILabel()
            square.backgroundColor = colorArray.randomElement()
            if square.backgroundColor == .gray {
                square.text = "gray"
            }
            else if square.backgroundColor == .red {
                square.text = "red"
            }
            else if square.backgroundColor == .yellow {
                square.text = "yellow"
            }
            else if square.backgroundColor == .cyan {
                square.text = "cyan"
            }
            else if square.backgroundColor == .magenta {
                square.text = "magenta"
            }
            else if square.backgroundColor == .blue {
                square.text = "blue"
            }
            square.frame.size = .init(width: 100, height: 100)
            if Int((x / Int(view.frame.maxX))*100) < Int(view.frame.maxX){
                square.frame.origin = .init(x: Int((x / Int(view.frame.maxX))*100) , y: Int((x % Int(view.frame.maxX))*100))
                view.addSubview(square)
            }
        }
    }
}



