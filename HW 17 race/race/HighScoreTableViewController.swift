//
//  HighScoreTableViewController.swift
//  race
//
//  Created by Ekaterina Abramova on 22.09.2020.
//  Copyright © 2020 Ekaterina Abramova. All rights reserved.
//

import UIKit

class HighScoreTableViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
//    static var arrayOfResultTuples: [(name: String, score: Int)] = [("Kate", 43), ("Vlada", 14), ("Iryna", 23)]
    static var arrayOfResultGame: [ResultGame] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = UserDefaults.standard.value(forKey: UserDefaultsKeys.resultsKey.rawValue) as? Data {
            do {
                let results = try JSONDecoder().decode([ResultGame].self, from: data)
                HighScoreTableViewController.arrayOfResultGame = results
            } catch {
                print(error)
                HighScoreTableViewController.arrayOfResultGame = [ResultGame]()
                print("Not found results")
            }
        } else {
            HighScoreTableViewController.arrayOfResultGame = [ResultGame]()
            print("Not found results")
        }
        
        view.backgroundColor = #colorLiteral(red: 0.4707121011, green: 0.561716848, blue: 0.6699119607, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = false
        
        if let data = UserDefaults.standard.value(forKey: UserDefaultsKeys.userKey.rawValue) as? Data {
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                ViewController.user = user
            } catch  {
                print(error)
                ViewController.user = User(userName: "Default name", userObstacleImageName: "stub-image", userCarImageName: "red-car-image", userSpeedCar: 16)
                print("Not found user")
            }
        } else {
            ViewController.user = User(userName: "Default name", userObstacleImageName: "stub-image", userCarImageName: "red-car-image", userSpeedCar: 16)
            print("Not found user")
        }
        
//        if let name: String = ViewController.user.userName {
//            nameLabel.text = name
//        } else {
//            nameLabel.text = "alalalalal"
//        }
//        nameLabel.text = "alalalalal"
    }
    
    
    
}

extension HighScoreTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HighScoreTableViewController.arrayOfResultGame.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = UITableViewCell()
        if HighScoreTableViewController.arrayOfResultGame.count != 0 {
            tableViewCell.textLabel?.text = "\(HighScoreTableViewController.arrayOfResultGame[indexPath.row].userName),  \(HighScoreTableViewController.arrayOfResultGame[indexPath.row].score), (\(HighScoreTableViewController.arrayOfResultGame[indexPath.row].time))"
        } else {
            tableViewCell.textLabel?.text = "Start the game to see the result!"
        }
        return tableViewCell
    }
    
    
}
