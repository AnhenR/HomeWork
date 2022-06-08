//
//  ViewController.swift
//  GameWithPan
//
//  Created by user on 8.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gamePanButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gamePanButton.layer.cornerRadius = 20
        
    }

    @IBAction func gamePanButtonAction(_ sender: Any) {
        tapGamePan()
    }
    
    private func tapGamePan(){
        let storyboard = UIStoryboard(name: "GamePanStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GamePan")
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
}

