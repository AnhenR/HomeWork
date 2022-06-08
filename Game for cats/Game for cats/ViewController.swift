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
    @IBOutlet weak var ballStartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 20
        ballStartButton.layer.cornerRadius = 20
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        tapGameCat()
    }
    
    @IBAction func ballStartButtonAction(_ sender: Any) {
        tapBallGame()
    }
  
    private func tapGameCat(){
        let storyboard = UIStoryboard(name: "GameCatStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GameCat")
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
    private func tapBallGame(){
        let storyboard = UIStoryboard(name: "GameTapStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GameTap")
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
}
