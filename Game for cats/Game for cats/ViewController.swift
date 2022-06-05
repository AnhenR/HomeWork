//
//  ViewController.swift
//  Game for cats
//
//  Created by user on 27.05.22.
//

import UIKit
class ViewController: UIViewController {
   
    @IBOutlet weak var catLable: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 20
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        tapGameCat()
    }
    
    private func tapGameCat(){
        let storyboard = UIStoryboard(name: "GameCatStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GameCat")
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}
