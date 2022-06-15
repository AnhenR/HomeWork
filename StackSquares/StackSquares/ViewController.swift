//
//  ViewController.swift
//  StackSquares
//
//  Created by user on 11.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var firstView = makeFirstView()
    private lazy var secondView = makeSecondView()
    private lazy var thirdView = makeThirdView()
    private lazy var fourthView = makeFourthView()
    
    private var firstTopAnchor: NSLayoutConstraint?
    private var firstBottomAnchor: NSLayoutConstraint?
    private var firstleadingAnchor: NSLayoutConstraint?
    private var firstTrailingAnchor: NSLayoutConstraint?
    
    private var secondTopAnchor: NSLayoutConstraint?
    private var secondBottomAnchor: NSLayoutConstraint?
    private var secondLeadingAnchor: NSLayoutConstraint?
    private var secondTrailingAnchor: NSLayoutConstraint?
    
    private var thirdTopAnchor: NSLayoutConstraint?
    private var thirdBottomAnchor: NSLayoutConstraint?
    private var thirdLeadingAnchor: NSLayoutConstraint?
    private var thirdTrailingAnchor: NSLayoutConstraint?
    
    private var fourthTopAnchor: NSLayoutConstraint?
    private var fourthBottomAnchor: NSLayoutConstraint?
    private var fourthLeadingAnchor: NSLayoutConstraint?
    private var fourthTrailingAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstView()
        setupSecondView()
        setupThirdView()
        setupFourthView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let singleTapFirstView = UITapGestureRecognizer(target: self, action:#selector(handleSingleTapFirstView))
        firstView.addGestureRecognizer(singleTapFirstView)
        let singleTapSecondView = UITapGestureRecognizer(target: self, action:#selector(handleSingleTapSecondView))
        secondView.addGestureRecognizer(singleTapSecondView)
        let singleTapThirdView = UITapGestureRecognizer(target: self, action:#selector(handleSingleTapThirdView))
        thirdView.addGestureRecognizer(singleTapThirdView)
        let singleTapFourthView = UITapGestureRecognizer(target: self, action:#selector(handleSingleTapFourthView))
        fourthView.addGestureRecognizer(singleTapFourthView)
        
        let upGestureFirst = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeFirstView))
        upGestureFirst.direction = .up
        firstView.addGestureRecognizer(upGestureFirst)
        let downGestureThird = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeThirdView))
        downGestureThird.direction = .down
        thirdView.addGestureRecognizer(downGestureThird)
        
        let panSecond = UIPanGestureRecognizer(target: self, action: #selector(handlePanSecond))
        secondView.addGestureRecognizer(panSecond)
        let panFourth = UIPanGestureRecognizer(target: self, action: #selector(handlePanFourth))
        fourthView.addGestureRecognizer(panFourth)
        
        
    }
    
    private func makeFirstView() -> UIView {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .blue
        return myView
    }
    
    private func setupFirstView() {
        view.addSubview(firstView)
        firstTopAnchor = firstView.topAnchor.constraint(equalTo: view.topAnchor, constant: 338)
        firstleadingAnchor = firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 97)
        firstTrailingAnchor = firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -217)
        firstBottomAnchor = firstView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -458)
        firstTopAnchor?.isActive = true
        firstleadingAnchor?.isActive = true
        firstTrailingAnchor?.isActive = true
        firstBottomAnchor?.isActive = true
        
    }
    
    private func makeSecondView() -> UIView {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .cyan
        return myView
    }
    
    private func setupSecondView() {
        view.addSubview(secondView)
        secondTopAnchor = secondView.topAnchor.constraint(equalTo: view.topAnchor, constant: 338)
        secondLeadingAnchor = secondView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 217)
        secondTrailingAnchor = secondView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -97)
        secondBottomAnchor = secondView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -458)
        secondTopAnchor?.isActive = true
        secondLeadingAnchor?.isActive = true
        secondTrailingAnchor?.isActive = true
        secondBottomAnchor?.isActive = true
    }
    
    private func makeThirdView() -> UIView {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .darkGray
        return myView
    }
    
    private func setupThirdView() {
        view.addSubview(thirdView)
        thirdTopAnchor = thirdView.topAnchor.constraint(equalTo: view.topAnchor, constant: 458)
        thirdLeadingAnchor = thirdView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 97)
        thirdTrailingAnchor = thirdView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -217)
        thirdBottomAnchor = thirdView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -338)
        thirdTopAnchor?.isActive = true
        thirdLeadingAnchor?.isActive = true
        thirdTrailingAnchor?.isActive = true
        thirdBottomAnchor?.isActive = true
    }
    
    private func makeFourthView() -> UIView {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .magenta
        return myView
    }
    
    private func setupFourthView() {
        view.addSubview(fourthView)
        fourthTopAnchor = fourthView.topAnchor.constraint(equalTo: view.topAnchor, constant: 458)
        fourthLeadingAnchor = fourthView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 217)
        fourthTrailingAnchor = fourthView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -97)
        fourthBottomAnchor = fourthView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -338)
        fourthTopAnchor?.isActive = true
        fourthLeadingAnchor?.isActive = true
        fourthTrailingAnchor?.isActive = true
        fourthBottomAnchor?.isActive = true
    }
    
    @objc func handleSingleTapFirstView(tapView: UITapGestureRecognizer) {
        firstView.isHidden = true
    }
    
    @objc func handleSingleTapSecondView(tapView: UITapGestureRecognizer) {
        secondView.isHidden = true
    }
    
    @objc func handleSingleTapThirdView(tapView: UITapGestureRecognizer) {
        thirdView.isHidden = true
    }
    
    @objc func handleSingleTapFourthView(tapView: UITapGestureRecognizer) {
        fourthView.isHidden = true
    }
    
    @objc func didSwipeFirstView(sender: UISwipeGestureRecognizer){
        firstTopAnchor?.isActive = false
        firstleadingAnchor?.isActive = false
        if sender.direction == .up {
            self.firstTopAnchor?.constant = 328
            self.firstleadingAnchor?.constant = 87
            firstTopAnchor?.isActive = true
            firstleadingAnchor?.isActive = true
        }
    }
    
    @objc func didSwipeThirdView(sender: UISwipeGestureRecognizer){
        thirdLeadingAnchor?.isActive = false
        thirdBottomAnchor?.isActive = false
        if sender.direction == .down {
            self.thirdBottomAnchor?.constant = -328
            self.thirdLeadingAnchor?.constant = 87
            thirdLeadingAnchor?.isActive = true
            thirdBottomAnchor?.isActive = true
        }
    }
    
    @objc func handlePanSecond(panSecond: UIPanGestureRecognizer){
        secondView.frame.origin = panSecond.location(in: view)
    }
    
    @objc func handlePanFourth(panFourth: UIPanGestureRecognizer){
        fourthView.frame.origin = panFourth.location(in: view)
    }
}
