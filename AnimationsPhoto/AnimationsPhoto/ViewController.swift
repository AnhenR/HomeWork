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

    private lazy var imageViewArray = [makeImageView(with: UIImage(named: "природа1") ?? UIImage()),
                                       makeImageView(with: UIImage(named: "природа2") ?? UIImage()),
                                       makeImageView(with: UIImage(named: "природа3") ?? UIImage()),
                                       makeImageView(with: UIImage(named: "природа4") ?? UIImage()),
                                       makeImageView(with: UIImage(named: "природа5") ?? UIImage())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage()
    }
    
    private func setupImage(){
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: self.view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])

        
        imageViewArray.enumerated().forEach{ index, item in
            imageViewArray[index].widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
            imageViewArray[index].topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            imageViewArray[index].bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            imageViewArray[index].leadingAnchor.constraint(equalTo: index == 0 ? contentView.leadingAnchor : imageViewArray[index - 1].trailingAnchor).isActive = true
            
        }
        
        
        leftAnchor = contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0)
        leftAnchor?.isActive = true
        
        let leftGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        leftGesture.direction = .left
        view.addGestureRecognizer(leftGesture)
    }
    
    private func makeImageView(with image: UIImage) -> UIImageView {
        let myImage = UIImageView()
        self.contentView.addSubview(myImage)
        myImage.image = image
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.contentMode = .scaleAspectFit
        myImage.layer.shadowColor = UIColor.gray.cgColor
        myImage.layer.shadowOffset = CGSize(width: 13, height: 13)
        myImage.layer.shadowOpacity = 0.8
        myImage.layer.shadowRadius = 6
        return myImage
    }
   
    @objc func didSwipe(){
        leftSideConstant += self.view.frame.width
        leftAnchor?.constant = -leftSideConstant
        UIView.animate(withDuration: 2) {
            self.view.layoutIfNeeded()
        }
    }
}

