//
//  HighScoreTableViewController.swift
//  race
//
//  Created by Ekaterina Abramova on 22.09.2020.
//  Copyright © 2020 Ekaterina Abramova. All rights reserved.
//

import UIKit

class HighScoreTableViewController: UIViewController {
    static var arrayOfResultGame: [ResultGame] = []
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!

    var count = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4707121011, green: 0.561716848, blue: 0.6699119607, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
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
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension HighScoreTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HighScoreTableViewController.arrayOfResultGame.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = UITableViewCell()
        if HighScoreTableViewController.arrayOfResultGame.count != 0 {
            let userName = HighScoreTableViewController.arrayOfResultGame[indexPath.row].userName
            let score = HighScoreTableViewController.arrayOfResultGame[indexPath.row].score
            let time = HighScoreTableViewController.arrayOfResultGame[indexPath.row].time
            tableViewCell.textLabel?.text = "\(userName),  \(score), (\(time))"
        } else {
            tableViewCell.textLabel?.text = "Start the game to see the result!"
        }
        return tableViewCell
    }
}
