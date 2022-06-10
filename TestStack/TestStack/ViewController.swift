//
//  ViewController.swift
//  TestStack
//
//  Created by user on 10.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    private let buttonTitleArray = ["AC", "+/-", "%", "/", "7", "8", "9","*", "4", "5", "6","-", "1", "2", "3", "+", "0", "0", ",", "="]

    private lazy var resultLabel = makeLable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        resultLabel.backgroundColor = .black
        stackedGrid(rows: 5, columns: 4, rootView: view)
    }
    
    private func stackedGrid(rows: Int, columns: Int, rootView: UIView) {
        let verticalStack = UIStackView()
        view.addSubview(verticalStack)
        verticalStack.axis = .vertical
        verticalStack.distribution = .fillEqually
        verticalStack.spacing = 10
        verticalStack.addArrangedSubview(resultLabel)
        
        for row in 0 ..< rows {
            let horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            horizontalStack.distribution = .fillEqually
            horizontalStack.spacing = 10
            
            for column in 0 ..< columns {
                let button = UIButton()
                button.backgroundColor = .orange
                button.layer.cornerRadius = 40
                button.setTitle("\(buttonTitleArray[row * columns + column])", for: .normal)
                button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
                horizontalStack.addArrangedSubview(button)
            }
            
            verticalStack.addArrangedSubview(horizontalStack)
        }
        
        rootView.addSubview(verticalStack)
        
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.topAnchor, constant: 10),
            verticalStack.leftAnchor.constraint(equalTo: rootView.leftAnchor, constant: 10),
            verticalStack.rightAnchor.constraint(equalTo: rootView.rightAnchor, constant: -10),
            verticalStack.bottomAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    private func makeLable() -> UILabel {
        let myLable = UILabel()
        myLable.translatesAutoresizingMaskIntoConstraints = false
        myLable.textColor = .white
        myLable.textAlignment = .right
        myLable.font = UIFont(name: "Helvetica", size: 60)
        return myLable
    }
    
    @objc func didTap(button: UIButton) {
        resultLabel.text = button.currentTitle ?? ""
    }
    
}
