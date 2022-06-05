//
//  ThirdViewController.swift
//  PassingString
//
//  Created by user on 3.06.22.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    lazy var thirdButton = makeButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController().string1
        Weather.weather.weatherOptions()
        thirdButton.setTitle("Well look", for: .normal)
        thirdButton.backgroundColor = .black
        thirdButton.layer.cornerRadius = 20
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.addSubview(thirdButton)
        NSLayoutConstraint.activate([
            thirdButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            thirdButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            thirdButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            thirdButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        thirdButton.addTarget(self, action: #selector(didTapThirdButton), for: .touchUpInside)
    }
    @objc func didTapThirdButton(){
        let storyboard = UIStoryboard(name: "FourthStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FourthViewController")
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    private func makeButton() -> UIButton {
        let myButton = UIButton()
        myButton.translatesAutoresizingMaskIntoConstraints = false
        return myButton
    }
}
