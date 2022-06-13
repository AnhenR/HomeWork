//
//  ViewController.swift
//  StackSquares
//
//  Created by user on 11.06.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rootStackView: UIStackView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapAppearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapButton.layer.cornerRadius = 15
        tapAppearButton.layer.cornerRadius = 15
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
        firstView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))
        
    }
    
    @objc func didTap(){
        rootStackView.frame.origin = .init(x: .random(in: 0...view.frame.maxX - rootStackView.frame.width), y: .random(in: 0...view.frame.maxY - rootStackView.frame.height))
    }
    
    @objc func didTapView(){
        firstView.frame =  .init(x: firstView.frame.origin.x, y: firstView.frame.origin.y, width: 10, height: 10)
    }


    
    @IBAction func tapButtonAction(_ sender: Any) {
        rootStackView.isHidden = true
        
    }
    
    @IBAction func tapAppearButtonAction(_ sender: Any) {
        rootStackView.isHidden = false
    }
}

