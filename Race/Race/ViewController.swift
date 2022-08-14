//
//  ViewController.swift
//  Race
//
//  Created by user on 6.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    private let string = "\(L10n.greetingFirst) \(L10n.greetingSecond) \(L10n.greetingThird) \(L10n.greetingFourth)"
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var recordTableButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.addShadow()
        startGameButton.setTitle(L10n.startButton, for: .normal)
        startGameButton.layer.cornerRadius = 20
        startGameButton.addShadow()
        settingsButton.setTitle(L10n.settingsButton, for: .normal)
        settingsButton.layer.cornerRadius = 20
        settingsButton.addShadow()
        recordTableButton.setTitle(L10n.recordButton, for: .normal)
        recordTableButton.layer.cornerRadius = 20
        recordTableButton.addShadow()
        
        let attributedString = NSMutableAttributedString(string: string)
        let range = (string as NSString).range(of: L10n.greetingFirst)
        let range2 = (string as NSString).range(of: L10n.greetingSecond)
        let range3 = (string as NSString).range(of: L10n.greetingThird)
        let range4 = (string as NSString).range(of: L10n.greetingFourth)
        attributedString.addAttribute(.foregroundColor, value: UIColor.white.cgColor , range: range)
        attributedString.addAttribute(.foregroundColor, value: UIColor.gray.cgColor , range: range2)
        attributedString.addAttribute(.foregroundColor, value: UIColor.darkGray.cgColor , range: range3)
        attributedString.addAttribute(.foregroundColor, value: UIColor.black.cgColor , range: range4)
        welcomeLabel.attributedText = attributedString
        welcomeLabel.font = UIFont(name: "OpenSans-Bold", size: 15)
        view.addGradient()
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
        viewController.modalPresentationStyle = .popover
        present(viewController, animated: true)
    }
    
    private func showRecordTable(){
        let storyboard = UIStoryboard(name: "RecordTableStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecordTableViewController")
        viewController.modalPresentationStyle = .popover
        present(viewController, animated: true)
    }
}
