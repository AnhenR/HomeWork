//
//  ViewController.swift
//  BalloonAnimation
//
//  Created by user on 15.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    private  var topAnchor: NSLayoutConstraint?
    private var bottomAnchor: NSLayoutConstraint?
    private var leadingAnchor: NSLayoutConstraint?
    private var trailingAnchor: NSLayoutConstraint?
    private var widthAnchor: NSLayoutConstraint?
    private var heightAnchor: NSLayoutConstraint?
    
    private var isTop: Bool = true
    private var isLeading: Bool = true
    
    private var ballView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .blue
        return myView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBall()
        createVerticalTimer()
        createHorizontalTimer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ballView.layer.cornerRadius = ballView.frame.height / 2
    }
    
    private func setupBall() {
        view.addSubview(ballView)
        
        topAnchor = ballView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        bottomAnchor = ballView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        leadingAnchor = ballView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        trailingAnchor = ballView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        widthAnchor = ballView.widthAnchor.constraint(equalToConstant: 20)
        heightAnchor = ballView.heightAnchor.constraint(equalToConstant: 20)
        //        topAnchor?.isActive = true
        bottomAnchor?.isActive = true
        //        leadingAnchor?.isActive = true
        trailingAnchor?.isActive = true
        widthAnchor?.isActive = true
        heightAnchor?.isActive = true
    }
    
    private func createHorizontalTimer() {
        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            if self.isLeading {
                self.animateTrailing()
            } else {
                self.animateLeading()
            }
        }
    }
    
    private func createVerticalTimer() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            if self.isTop {
                self.animateBottom()
            } else {
                self.animateTop()
            }
        }
    }
    
    private func animateTrailing() {
        trailingAnchor?.isActive = true
        leadingAnchor?.isActive = false
        UIView.animate(withDuration: 7.0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.isLeading = false
        }
    }
    
    private func animateLeading() {
        leadingAnchor?.isActive = true
        trailingAnchor?.isActive = false
        UIView.animate(withDuration: 7.0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.isLeading = true
        }
    }
    
    private func animateTop() {
        topAnchor?.isActive = true
        bottomAnchor?.isActive = false
        UIView.animate(withDuration: 7.0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.isTop = true
        }
    }
    
    private func animateBottom() {
        topAnchor?.isActive = false
        bottomAnchor?.isActive = true
        UIView.animate(withDuration: 7.0) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.isTop = false
        }
    }
}

