//
//  ImageController.swift
//  Xib
//
//  Created by user on 18.07.22.
//

import Foundation
import UIKit

class ImageController: UIViewController {
    
    private let dismissButton = UIButton()
    private let scrollView = UIScrollView()
    private let backgroundView = UIView()
    private let likeButton = UIButton()
    private let commentField = UITextField()
    private lazy var imageViewArray = [makeImageView(with: UIImage(named: "") ?? UIImage())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        configUI()
        
    }
    
    private func configUI() {
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dismissButton.widthAnchor.constraint(equalToConstant: 30),
            dismissButton.heightAnchor.constraint(equalToConstant: 30),
            
            scrollView.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 500),
            
            backgroundView.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -230),
            
            commentField.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            commentField.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            commentField.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            commentField.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: -10),
            
            likeButton.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            likeButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            likeButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            likeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func makeUI() {
        view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.setBackgroundImage(UIImage(named: "dismiss"), for: .normal)
        dismissButton.addTarget(self, action: #selector(didTapDismiss), for: .touchUpInside)
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    private func makeImageView(with image: UIImage) -> UIImageView {
        let myImage = UIImageView()
        myImage.image = image
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.contentMode = .scaleAspectFit
        return myImage
    }
    
    @objc private func didTapDismiss() {
        dismiss(animated: true)
    }
    
    @objc private func didTapLike(_ sender: UIButton) {
            likeButton.isSelected = true
    }
}
