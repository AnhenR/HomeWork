//
//  ImageController.swift
//  Xib
//
//  Created by user on 18.07.22.
//

import Foundation
import UIKit

class ImageController: UIViewController, UIScrollViewDelegate {
    
    private let dismissButton = UIButton()
    private let scrollView = UIScrollView()
    private var bottomBackgroundView: NSLayoutConstraint?
    private let backgroundView = UIView()
    private let likeButton = UIButton()
    private let commentField = UITextField()
    private lazy var imageViewArray = [makeImageView(with: UIImage(named: "природа1") ?? UIImage()), makeImageView(with: UIImage(named: "природа2") ?? UIImage()), makeImageView(with: UIImage(named: "природа3") ?? UIImage()), makeImageView(with: UIImage(named: "природа4") ?? UIImage())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        configUI()
        scrollViewSetting()
        showKeyboard()
    }
    
    private func configUI() {
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dismissButton.widthAnchor.constraint(equalToConstant: 30),
            dismissButton.heightAnchor.constraint(equalToConstant: 30),
            
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backgroundView.heightAnchor.constraint(equalToConstant: 40),
            
            commentField.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            commentField.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            commentField.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            commentField.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: -10),
            
            likeButton.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            likeButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            likeButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            likeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        bottomBackgroundView = backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        bottomBackgroundView?.isActive = true
    }
    
    private func makeUI() {
        view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.setBackgroundImage(UIImage(named: "dismiss"), for: .normal)
        dismissButton.addTarget(self, action: #selector(didTapDismiss), for: .touchUpInside)
        
        view .addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setBackgroundImage(UIImage(named: "beforeLike"), for: .normal)
        likeButton.setBackgroundImage(UIImage(named: "afterLike"), for: .selected)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        
        backgroundView.addSubview(commentField)
        commentField.translatesAutoresizingMaskIntoConstraints = false
        commentField.backgroundColor = .gray
        commentField.placeholder = "Speak out!"
        commentField.textAlignment = .left
        commentField.keyboardAppearance = .dark
    }
    
    private func scrollViewSetting() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: backgroundView.topAnchor, constant: -5)
        ])
        imageViewArray.enumerated().forEach{ index, item in
            imageViewArray[index].heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
            imageViewArray[index].widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            imageViewArray[index].topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            imageViewArray[index].leadingAnchor.constraint(equalTo: index == 0 ? scrollView.leadingAnchor : imageViewArray[index - 1].trailingAnchor).isActive = true

            scrollView.contentSize = CGSize(width: (view.frame.width * CGFloat(index + 1)), height: scrollView.frame.height)
        }
    }
    
    private func makeImageView(with image: UIImage) -> UIImageView {
        let myImage = UIImageView()
        scrollView.addSubview(myImage)
        myImage.image = image
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.contentMode = .scaleAspectFit
        return myImage
    }
    
    private func showKeyboard() {
        let showNotification = UIResponder.keyboardWillShowNotification
        NotificationCenter.default.addObserver(forName: showNotification, object: nil, queue: .main) { notification in
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.bottomBackgroundView?.constant = -(keyboardSize.height + 10.0)
                UIView.animate(withDuration: 5.0) {
                    self.view.layoutIfNeeded()
                }
            }
        }
        
        let hideNotification = UIResponder.keyboardWillHideNotification
        NotificationCenter.default.addObserver(forName: hideNotification, object: nil, queue: .main) { _ in
            self.bottomBackgroundView?.constant = -30
            UIView.animate(withDuration: 5.0) {
                self.view.layoutIfNeeded()
            }
        }
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))
    }
    
    @objc private func didTapDismiss() {
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    @objc private func didTapLike() {
        likeButton.isSelected = likeButton.isSelected ? false : true
    }
    
    @objc private func didTapView() {
        view.endEditing(true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print (scrollView.contentOffset)
        if scrollView.contentOffset == CGPoint(x: scrollView.contentSize.width - view.frame.width + 3, y: 0)  {
            scrollView.contentOffset = CGPoint(x: 0, y: 0)
        }
    }
}

