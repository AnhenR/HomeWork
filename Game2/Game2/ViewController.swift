//
//  ViewController.swift
//  Game2
//
//  Created by user on 29.05.22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var squareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        squareButton.layer.cornerRadius = 20
    }
    
    @IBAction func squareButtonAction(_ sender: Any) {
        tapGameSquares()
    }
    
    private func tapGameSquares(){
        let storyboard = UIStoryboard(name: "GameSquaresStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GameSquaresViewController")
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}




