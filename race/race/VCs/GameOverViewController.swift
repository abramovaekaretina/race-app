//
//  GameOverViewController.swift
//  race
//
//  Created by Ekaterina Abramova on 22.02.2021.
//  Copyright © 2021 Ekaterina Abramova. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var backToMenuButton: UIButton!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var blurEffectView: UIVisualEffectView!
    @IBOutlet weak var gameOverLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        blurEffectView.alpha = 0.9
        setFont(label: "back to menu", for: backToMenuButton)
        setFont(label: "try again", for: tryAgainButton)

        backToMenuButton.backgroundColor = .black
        tryAgainButton.backgroundColor = .black
        backToMenuButton.layer.cornerRadius = backToMenuButton.frame.height / 2
        tryAgainButton.layer.cornerRadius = tryAgainButton.frame.height / 2

        let text = "YOU LOSE :("
        let wholeRangeText = (text as NSString).range(of: text)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.font, value: UIFont.perfect(ofSize: 30), range: wholeRangeText)
        gameOverLabel.attributedText = attributedText

    }

    @IBAction func tryAgainButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nameController = String(describing: GameViewController.self)
        let viewController = storyboard.instantiateViewController(identifier: nameController) as GameViewController
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func backToMenuButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nameController = String(describing: ViewController.self)
        let viewController = storyboard.instantiateViewController(identifier: nameController) as ViewController
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
