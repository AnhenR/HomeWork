//
//  SettingsViewController.swift
//  Race
//
//  Created by user on 6.06.22.
//

import Foundation
import UIKit

enum UserDefaultsKeys : String {
    case car = "car"
    case ball1 = "ball1"
    case ball2 = "ball2"
}

class SettingsViewController: UIViewController {
    
    private let settingsLabel = UILabel()
    private let firstLevelButton = UIButton()
    private let secondLevelButton = UIButton()
    private let nameButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGradient()
        configureUi()
        makeUI()
    }
    
    private func makeUI() {
        NSLayoutConstraint.activate([
            settingsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            settingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            settingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            settingsLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -400),
            
            nameButton.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor, constant: 40),
            nameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameButton.heightAnchor.constraint(equalToConstant: 70),
            
            firstLevelButton.topAnchor.constraint(equalTo: nameButton.bottomAnchor, constant: 30),
            firstLevelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            firstLevelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            firstLevelButton.heightAnchor.constraint(equalToConstant: 70),
            
            secondLevelButton.topAnchor.constraint(equalTo: firstLevelButton.bottomAnchor, constant: 30),
            secondLevelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            secondLevelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            secondLevelButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90)
        ])
    }
    
    private func configureUi() {
        view.addSubview(settingsLabel)
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsLabel.textColor = .white
        settingsLabel.textAlignment = .center
        settingsLabel.text = "Level selection"
        
        view.addSubview(nameButton)
        nameButton.translatesAutoresizingMaskIntoConstraints = false
        nameButton.addShadow()
        nameButton.backgroundColor = .darkGray
        nameButton.layer.cornerRadius = 20
        nameButton.setTitle("Introduce yourself", for: .normal)
        nameButton.addTarget(self, action: #selector(didTapNameButton), for: .touchUpInside)
        
        view.addSubview(firstLevelButton)
        firstLevelButton.translatesAutoresizingMaskIntoConstraints = false
        firstLevelButton.addShadow()
        firstLevelButton.backgroundColor = .darkGray
        firstLevelButton.layer.cornerRadius = 20
        firstLevelButton.setTitle("Easy level", for: .normal)
        firstLevelButton.addTarget(self, action: #selector(didTapFirstLevelButton), for: .touchUpInside)
        
        view.addSubview(secondLevelButton)
        secondLevelButton.translatesAutoresizingMaskIntoConstraints = false
        secondLevelButton.addShadow()
        secondLevelButton.backgroundColor = .darkGray
        secondLevelButton.layer.cornerRadius = 20
        secondLevelButton.setTitle("Hard level", for: .normal)
        secondLevelButton.addTarget(self, action: #selector(didTapSecondLevelButton), for: .touchUpInside)
    }
    
    @objc func didTapNameButton(){
        let alertContr = UIAlertController(title: "Enter your name", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Save", style: .default) { (action) in
            let text = alertContr.textFields?.first?.text
        }
        
        alertContr.addTextField(configurationHandler: nil)
        alertContr.addAction(action)
        self.present(alertContr, animated: true, completion: nil)
    }
    
    @objc func didTapFirstLevelButton(){
        UserDefaults.standard.set("car1", forKey: .car)
        UserDefaults.standard.set("grayBall1", forKey: .ball1)
        UserDefaults.standard.set("whiteBall1", forKey: .ball2)
    }
    
    @objc func didTapSecondLevelButton(){
        UserDefaults.standard.set("car2", forKey: .car)
        UserDefaults.standard.set("grayBall2", forKey: .ball1)
        UserDefaults.standard.set("whiteBall2", forKey: .ball2)
    }
}

extension UserDefaults  {
    func set(_ value: Any?, forKey key: UserDefaultsKeys) {
        set(value, forKey: key.rawValue)
    }
    
    func value(forKey key: UserDefaultsKeys) -> Any? {
        return value(forKey: key.rawValue)
    }
}
