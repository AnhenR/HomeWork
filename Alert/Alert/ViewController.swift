//
//  ViewController.swift
//  Alert
//
//  Created by user on 6.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    let buttonAlertText = UIButton()
    let buttonAlertOne = UIButton()
    let buttonAlertTwo = UIButton()
    let hamburgerButton = UIButton()
    
    var sidebarViewController: UIViewController!
    var ifShow = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUi()
        makeUi()
    }
    
    private func makeUi() {
        NSLayoutConstraint.activate([
            hamburgerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            hamburgerButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            hamburgerButton.widthAnchor.constraint(equalToConstant: 40),
            hamburgerButton.heightAnchor.constraint(equalToConstant: 40),
            
            buttonAlertText.heightAnchor.constraint(equalToConstant: 30),
            buttonAlertText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonAlertText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonAlertText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            
            buttonAlertOne.heightAnchor.constraint(equalToConstant: 30),
            buttonAlertOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonAlertOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonAlertOne.bottomAnchor.constraint(equalTo: buttonAlertText.topAnchor, constant: -10),
            
            buttonAlertTwo.heightAnchor.constraint(equalToConstant: 30),
            buttonAlertTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonAlertTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonAlertTwo.bottomAnchor.constraint(equalTo: buttonAlertOne.topAnchor, constant: -10)
        ])
    }
    
    private func configureUi() {
        view.addSubview(hamburgerButton)
        hamburgerButton.translatesAutoresizingMaskIntoConstraints = false
        hamburgerButton.setImage(UIImage(named: "гамбургер")?.withRenderingMode(.alwaysOriginal), for: .normal)
        hamburgerButton.addTarget(self, action: #selector(didTapHamburger), for: .touchUpInside)
        
        view.addSubview(buttonAlertText)
        buttonAlertText.translatesAutoresizingMaskIntoConstraints = false
        buttonAlertText.backgroundColor = .black
        buttonAlertText.layer.cornerRadius = 20
        buttonAlertText.setTitle("Tap me", for: .normal)
        buttonAlertText.addTarget(self, action: #selector(didTapButtonAlertText), for: .touchUpInside)
        
        view.addSubview(buttonAlertOne)
        buttonAlertOne.translatesAutoresizingMaskIntoConstraints = false
        buttonAlertOne.backgroundColor = .black
        buttonAlertOne.layer.cornerRadius = 20
        buttonAlertOne.setTitle("Tap me", for: .normal)
        buttonAlertOne.addTarget(self, action: #selector(didTapButtonAlertOne), for: .touchUpInside)
        
        view.addSubview(buttonAlertTwo)
        buttonAlertTwo.translatesAutoresizingMaskIntoConstraints = false
        buttonAlertTwo.backgroundColor = .black
        buttonAlertTwo.layer.cornerRadius = 20
        buttonAlertTwo.setTitle("Tap me", for: .normal)
        buttonAlertTwo.addTarget(self, action: #selector(didTapButtonAlertTwo), for: .touchUpInside)
    }
    
    private func configureShow() {
        if sidebarViewController == nil {
            sidebarViewController = Sidebar()
            view.insertSubview(sidebarViewController.view, at: 0)
            addChild(sidebarViewController)
        }
    }
    
    private func showSidebar(show: Bool) {
        if show {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                self.view.frame.origin.x = self.view.frame.width - 140
            } completion: { (no) in
                self.blur()
                
            }
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                self.view.frame.origin.x = 0
            } completion: { (no) in
                self.view.viewWithTag(666)?.isHidden = true
                
            }
        }
    }
    
    private func tapButton() {
        configureShow()
        ifShow = !ifShow
        showSidebar(show: ifShow)
    }
    
    private func blur() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.tag = 666
        view.insertSubview(blurEffectView, at: 0)
    }
    
    @objc func didTapHamburger(){
        tapButton()
    }
    
    @objc func didTapButtonAlertText(){
        alertTextField(titleController: "Введите пароль", massage: "пожалуйста", styleController: .alert, titleAction: "ввод", styleAction: .default)
    }
    
    @objc func didTapButtonAlertOne(){
        alertButton(titleController: "Eror", massage: "oh no", styleController: .actionSheet, titleAction: "Ok", styleAction: .default)
    }
    
    @objc func didTapButtonAlertTwo(){
        alertTwoButtons(titleController: "Eror", massage: "nono", styleController: .alert, titleActionFirst: "Yes", styleActionFirst: .default, titleActionSecond: "No", styleActionSecond: .default)
    }
}



