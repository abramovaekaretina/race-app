//
//  GameViewController.swift
//  race
//
//  Created by Ekaterina Abramova on 22.09.2020.
//  Copyright © 2020 Ekaterina Abramova. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    static let dateFormatter = DateFormatter()
    var startPosition = CGPoint(x: 0, y: 0)
    var carImageView: UIImageView!
    var timeScore = 0
    @IBOutlet weak var moveToLeftButton: UIButton!
    @IBOutlet weak var moveToRightButton: UIButton!
    @IBOutlet weak var roadImageView: UIImageView!
    @IBOutlet weak var obstacleView: UIView!
    @IBOutlet weak var obstacle1ImageView: UIImageView!
    @IBOutlet weak var obstacle2ImageView: UIImageView!
    @IBOutlet weak var obstacle3ImageView: UIImageView!
    @IBOutlet weak var obstacle4ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = UserDefaults.standard.value(forKey: UserDefaultsKeys.userKey.rawValue) as? Data {
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                ViewController.user = user
            } catch {
                print(error)
                ViewController.user = User(userName: "Default name",
                                           userObstacleImageName: "stub-image",
                                           userCarImageName: "red-car-image",
                                           userSpeedCar: 16)
                print("Not found user")
            }
        } else {
            ViewController.user = User(userName: "Default name",
                                       userObstacleImageName: "stub-image",
                                       userCarImageName: "red-car-image",
                                       userSpeedCar: 16)
            print("Not found user")
        }
        print("\n\(ViewController.user.userName)")
        print(ViewController.user.userCarImageName)
        print(ViewController.user.userObstacleImageName)
        print("\(ViewController.user.userSpeedCar) - 1 user")

        roadImageView.contentMode = .scaleAspectFill
        startPosition = self.roadImageView.frame.origin
        moveRoad()
        self.carImageView = UIImageView()
        self.carImageView.contentMode = .scaleAspectFit
        self.carImageView.image = UIImage(named: ViewController.user.userCarImageName)
        self.carImageView.frame.origin = CGPoint(x: 150, y: 578)
        self.carImageView.frame.size = CGSize(width: 103, height: 164)
        view.addSubview(self.carImageView)
        let arrayOfObstacleImageView: [UIImageView] = [
            obstacle1ImageView, obstacle2ImageView, obstacle3ImageView, obstacle4ImageView
        ]
        arrayOfObstacleImageView.map { (imageView) in
            imageView.image = UIImage(named: ViewController.user.userObstacleImageName)
        }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            self.timeScore += 1
        }
        GameViewController.dateFormatter.dateStyle = .medium
        GameViewController.dateFormatter.setLocalizedDateFormatFromTemplate("MMM d, h:mm a")
        print(GameViewController.dateFormatter.string(from: Date()))
    }
    func moveRoad() {
        UIView.animate(withDuration: ViewController.user.userSpeedCar, delay: 0, options: [.curveLinear], animations: {
            self.roadImageView.frame.origin = self.view.frame.origin
            self.obstacleView.frame.origin = self.view.frame.origin
        }) { (_) in
            self.roadImageView.frame.origin = self.startPosition
            self.obstacleView.frame.origin = self.startPosition
            self.moveRoad()
        }
    }
    func moveCarToLeft() {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveLinear], animations: {
            self.carImageView.center.x -= 10
            if self.carImageView.frame.origin.x == -20 {
                self.backToMainView()
            }
            let arrayOfObstacleImageView: [UIImageView] = [
                self.obstacle1ImageView, self.obstacle2ImageView, self.obstacle3ImageView, self.obstacle4ImageView
            ]
            for obstacle in arrayOfObstacleImageView {
                if self.carImageView.frame.intersects(obstacle.frame) {
                    self.backToMainView()
                }
            }
            if self.carImageView.frame.intersects(self.obstacle1ImageView.frame) {
                self.backToMainView()
            }
        }) { (_) in
            self.moveCarToLeft()
        }
    }
    func moveCarToRight() {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveLinear], animations: {
            self.carImageView.center.x += 10
            if self.carImageView.frame.origin.x + self.carImageView.frame.width > self.view.frame.width {
                self.backToMainView()
            }
            let arrayOfObstacleImageView: [UIImageView] = [
                self.obstacle1ImageView, self.obstacle2ImageView, self.obstacle3ImageView, self.obstacle4ImageView
            ]
            for obstacle in arrayOfObstacleImageView {
                if self.carImageView.frame.intersects(obstacle.frame) {
                    self.backToMainView()
                }
            }
        }) { (_) in
            self.moveCarToRight()
        }
    }
    @IBAction func moveToLeftButtonPressed(_ sender: Any) {
        moveCarToLeft()
    }
    @IBAction func moveToRightButtonPressed(_ sender: Any) {
        moveCarToRight()
    }
    func backToMainView() {
        let newRecord = ResultGame(userName: ViewController.user.userName,
                                   time: GameViewController.dateFormatter.string(from: Date()),
                                   score: timeScore)
        HighScoreTableViewController.arrayOfResultGame.append(newRecord)
        moveToLeftButton.isSelected = false
        moveToRightButton.isSelected = false
        do {
            let data = try JSONEncoder().encode(HighScoreTableViewController.arrayOfResultGame)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.resultsKey)
        } catch {
            print(error)
        }
        navigationController?.popViewController(animated: true)
    }
}
