//
//  SecondViewController.swift
//  PassingString
//
//  Created by user on 3.06.22.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    var secondLaughString = ""
    lazy var secondButton = makeButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondButton.setTitle("Sure?", for: .normal)
        secondButton.backgroundColor = .black
        secondButton.layer.cornerRadius = 20
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.addSubview(secondButton)
        NSLayoutConstraint.activate([
            secondButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            secondButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            secondButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        secondButton.addTarget(self, action: #selector(didTapSecondButton), for: .touchUpInside)
    }
    @objc func didTapSecondButton(){
        let storyboard = UIStoryboard(name: "ThirdStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        viewController.modalPresentationStyle = .fullScreen
        viewController.thirdLaughString = secondLaughString
        present(viewController, animated: true)
    }
    private func makeButton() -> UIButton {
        let myButton = UIButton()
        myButton.translatesAutoresizingMaskIntoConstraints = false
        return myButton
    }
}
