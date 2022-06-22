//
//  ViewController.swift
//  Race
//
//  Created by user on 6.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var recordTableButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.addShadow()
        startGameButton.layer.cornerRadius = 20
        startGameButton.addShadow()
        settingsButton.layer.cornerRadius = 20
        settingsButton.addShadow()
        recordTableButton.layer.cornerRadius = 20
        recordTableButton.addShadow()
    }
    
    @IBAction func startGameButtonAction(_ sender: Any) {
        showGame()
    }
    @IBAction func settingsButtonAction(_ sender: Any) {
        showSettings()
    }
    @IBAction func recordTableButtonAction(_ sender: Any) {
        showRecordTable()
    }
    
    private func showGame(){
        let storyboard = UIStoryboard(name: "GameStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "GameViewController")
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    private func showSettings(){
        let storyboard = UIStoryboard(name: "SettingsStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SettingsViewController")
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    private func showRecordTable(){
        let storyboard = UIStoryboard(name: "RecordTableStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecordTableViewController")
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}

extension UIView {
    func addShadow(shadowColor: UIColor = .gray,shadowOffset: CGSize = CGSize(width: 8, height: 8),shadowOpacity: Float = 0.5,shadowRadius: Double = 6 ) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}
