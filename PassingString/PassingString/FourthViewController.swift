//
//  FourthViewController.swift
//  PassingString
//
//  Created by user on 3.06.22.
//

import Foundation
import UIKit

class FourthViewController: UIViewController {
    lazy var fourthButton = makeButton()
    private var fourthLaughString = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fourthButton.setTitle("I warned", for: .normal)
        fourthButton.backgroundColor = .black
        fourthButton.layer.cornerRadius = 20
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.addSubview(fourthButton)
        NSLayoutConstraint.activate([
            fourthButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            fourthButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            fourthButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            fourthButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        fourthButton.addTarget(self, action: #selector(didTapFourthButton), for: .touchUpInside)
    }
    
    @objc func didTapFourthButton(){
        let storyboard = UIStoryboard(name: "FifthStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FifthViewController") as! FifthViewController
        viewController.setString(newString: fourthLaughString)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func makeButton() -> UIButton {
        let myButton = UIButton()
        myButton.translatesAutoresizingMaskIntoConstraints = false
        return myButton
    }
    
    func setString(newString: String){
        fourthLaughString = newString
    }
}
