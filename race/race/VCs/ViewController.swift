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
    @IBOutlet weak var buttonsView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setFont(label: "start", for: startButton)
        setFont(label: "high score", for: highScorebutton)
        setFont(label: "setting", for: settingsButton)

        startRaceImageView = UIImageView()
        startRaceImageView.contentMode = .scaleAspectFit
        startRaceImageView.image = UIImage(named: "race")
        startRaceImageView.frame.origin = CGPoint(x: 0, y: -170)
        startRaceImageView.frame.size = CGSize(width: 800, height: 1500)

        view.addSubview(startRaceImageView)
        view.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        view.bringSubviewToFront(nameLabel)

        startButton.backgroundColor = .white
        startButton.layer.cornerRadius = startButton.frame.height / 2

        settingsButton.backgroundColor = .white
        settingsButton.layer.cornerRadius = settingsButton.frame.height / 2

        highScorebutton.backgroundColor = .white
        highScorebutton.layer.cornerRadius = highScorebutton.frame.height / 2
        view.bringSubviewToFront(buttonsView)

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startButton.getGradient(colors: [#colorLiteral(red: 1, green: 0.5643388629, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.397720933, green: 0.6568412781, blue: 0.9055325985, alpha: 1).cgColor],
                                startPoint: CGPoint(x: 0.5, y: 0),
                                endPoint: CGPoint(x: 0.5, y: 1))
        settingsButton.getGradient(colors: [#colorLiteral(red: 1, green: 0.5643388629, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.397720933, green: 0.6568412781, blue: 0.9055325985, alpha: 1).cgColor],
                                   startPoint: CGPoint(x: 0.5, y: 0),
                                   endPoint: CGPoint(x: 0.5, y: 1))
        highScorebutton.getGradient(colors: [#colorLiteral(red: 1, green: 0.5643388629, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.397720933, green: 0.6568412781, blue: 0.9055325985, alpha: 1).cgColor],
                                    startPoint: CGPoint(x: 0.5, y: 0),
                                    endPoint: CGPoint(x: 0.5, y: 1))
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func startButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nameController = String(describing: GameViewController.self)
        let viewController = storyboard.instantiateViewController(identifier: nameController) as GameViewController
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func settingsbuttonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nameController = String(describing: SettingsViewController.self)
        let viewController = storyboard.instantiateViewController(identifier: nameController) as SettingsViewController
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func highScoreButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nameController = String(describing: HighScoreTableViewController.self)
        let viewController = storyboard.instantiateViewController(identifier: nameController) as HighScoreTableViewController
        viewController.count = 2
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }

    func setFont(label string: String, for button: UIButton) {
        let text = "\(string)"
        let wholeRangeText = (text as NSString).range(of: text)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.font, value: UIFont.perfect(ofSize: 20), range: wholeRangeText)
        if let title = button.titleLabel {
            title.attributedText = attributedText
        }
    }
}
