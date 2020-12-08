//
//  ViewController.swift
//  race
//
//  Created by Ekaterina Abramova on 22.09.2020.
//  Copyright © 2020 Ekaterina Abramova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var startRaceImageView: UIImageView!
    
    static var user: User!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var highScorebutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startText = "start"
        let wholeRangeStartText = (startText as NSString).range(of: startText)
        let attributedStartText = NSMutableAttributedString(string: startText)
        attributedStartText.addAttribute(.font, value: UIFont.perfect(ofSize: 20), range: wholeRangeStartText)
        if let title = startButton.titleLabel {
            title.attributedText = attributedStartText
        }
        
        let highScoreText = "high score"
        let wholeRangeHighScoreText = (highScoreText as NSString).range(of: highScoreText)
        let attributedHighScoreText = NSMutableAttributedString(string: highScoreText)
        attributedHighScoreText.addAttribute(.font, value: UIFont.perfect(ofSize: 20), range: wholeRangeHighScoreText)
        if let title = highScorebutton.titleLabel {
            title.attributedText = attributedHighScoreText
        }
        
        let settingText = "setting"
        let wholeRangeSettingText = (settingText as NSString).range(of: settingText)
        let attributedSettingText = NSMutableAttributedString(string: settingText)
        attributedSettingText.addAttribute(.font, value: UIFont.perfect(ofSize: 20), range: wholeRangeSettingText)
        if let title = settingsButton.titleLabel {
            title.attributedText = attributedSettingText
        }
        
        startRaceImageView = UIImageView()
        startRaceImageView.contentMode = .scaleAspectFit
        startRaceImageView.image = UIImage(named: "race")
        startRaceImageView.frame.origin = CGPoint(x: 0, y: -170)
        startRaceImageView.frame.size = CGSize(width: 800, height: 1500)
        view.addSubview(startRaceImageView)
        view.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        
        view.bringSubviewToFront(nameLabel)
        
        view.bringSubviewToFront(startButton)
        startButton.backgroundColor = .white
        startButton.layer.cornerRadius = startButton.frame.height / 2
        
        view.bringSubviewToFront(highScorebutton)
        settingsButton.backgroundColor = .white
        settingsButton.layer.cornerRadius = settingsButton.frame.height / 2
        
        view.bringSubviewToFront(settingsButton)
        highScorebutton.backgroundColor = .white
        highScorebutton.layer.cornerRadius = highScorebutton.frame.height / 2
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
                
        startButton.getGradient(colors: [#colorLiteral(red: 1, green: 0.5643388629, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.397720933, green: 0.6568412781, blue: 0.9055325985, alpha: 1).cgColor], startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
        settingsButton.getGradient(colors: [#colorLiteral(red: 1, green: 0.5643388629, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.397720933, green: 0.6568412781, blue: 0.9055325985, alpha: 1).cgColor], startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
        highScorebutton.getGradient(colors: [#colorLiteral(red: 1, green: 0.5643388629, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.397720933, green: 0.6568412781, blue: 0.9055325985, alpha: 1).cgColor], startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func startButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: String(describing: GameViewController.self)) as! GameViewController
        viewController.modalPresentationStyle = .fullScreen
//        self.present(viewController, animated: true)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func settingsbuttonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: String(describing: SettingsViewController.self)) as! SettingsViewController
        viewController.modalPresentationStyle = .fullScreen
//        self.present(viewController, animated: true)
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @IBAction func highScoreButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: String(describing: HighScoreTableViewController.self)) as! HighScoreTableViewController
        viewController.modalPresentationStyle = .fullScreen
//        self.present(viewController, animated: true)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

