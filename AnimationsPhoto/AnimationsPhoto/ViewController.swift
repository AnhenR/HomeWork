//
//  ViewController.swift
//  AnimationsPhoto
//
//  Created by user on 15.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    private let contentView = UIView()
    private var leftAnchor: NSLayoutConstraint?
    private var leftSideConstant: CGFloat = 0
    private var image1: UIImageView = {
        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        return myImage
    }()
    
    private var image2: UIImageView = {
        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        return myImage
    }()
    
    private var image3: UIImageView = {
        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        return myImage
    }()
    
    private var image4: UIImageView = {
        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        return myImage
    }()
    
    private var image5: UIImageView = {
        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        return myImage
    }()
    
    private var image: UIImageView = {
        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        return myImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage()
    }
    
    private func setupImage(){
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(contentView)
        
        [image1, image2, image3, image4, image5].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.contentMode = .scaleAspectFit
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: self.view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            image1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image1.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            image1.topAnchor.constraint(equalTo: contentView.topAnchor),
            image1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            image2.leadingAnchor.constraint(equalTo: image1.trailingAnchor),
            image2.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            image2.topAnchor.constraint(equalTo: contentView.topAnchor),
            image2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            image3.leadingAnchor.constraint(equalTo: image2.trailingAnchor),
            image3.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            image3.topAnchor.constraint(equalTo: contentView.topAnchor),
            image3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            image4.leadingAnchor.constraint(equalTo: image3.trailingAnchor),
            image4.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            image4.topAnchor.constraint(equalTo: contentView.topAnchor),
            image4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            image5.leadingAnchor.constraint(equalTo: image3.trailingAnchor),
            image5.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            image5.topAnchor.constraint(equalTo: contentView.topAnchor),
            image5.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        image1.image = .init(named: "природа1")
        image2.image = .init(named: "природа2")
        image3.image = .init(named: "природа3")
        image4.image = .init(named: "природа4")
        image5.image = .init(named: "природа5")
        
        leftAnchor = contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0)
        leftAnchor?.isActive = true
        
        let leftGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        leftGesture.direction = .left
        view.addGestureRecognizer(leftGesture)
    }
   
    @objc func didSwipe(){
        leftSideConstant += self.view.frame.width
        leftAnchor?.constant = -leftSideConstant
        UIView.animate(withDuration: 2) {
            self.view.layoutIfNeeded()
        }
    }
}

