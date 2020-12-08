//
//  SettingsViewController.swift
//  race
//
//  Created by Ekaterina Abramova on 22.09.2020.
//  Copyright © 2020 Ekaterina Abramova. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var sendUserNameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendUserNameButton.layer.cornerRadius = 5
        if let data = UserDefaults.standard.value(forKey: "UserKey") as? Data {
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                ViewController.user = user
            } catch  {
                print(error)
                ViewController.user = User(userName: "Default name", userObstacleImageName: "stub-image", userCarImageName: "red-car-image", userSpeedCar: 16)
            }
        } else {
            ViewController.user = User(userName: "Default name", userObstacleImageName: "stub-image", userCarImageName: "red-car-image", userSpeedCar: 16)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = UIColor.darkGray
    }
    
    @IBAction func onBackButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectYellowCarButtonTapped(_ sender: Any) {
        ViewController.user.userCarImageName = "yellow-car-image"
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.userKey)
        } catch {
            print(error)
        }
    }
    
    @IBAction func selectRedCarButtonTapped(_ sender: Any) {
        ViewController.user.userCarImageName = "red-car-image"
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.userKey)
        } catch {
            print(error)
        }
    }
    
    @IBAction func selectOrangeCarButtonTapped(_ sender: Any) {
        ViewController.user.userCarImageName = "orange-car-image"
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.userKey)
        } catch {
            print(error)
        }
    }
    
    @IBAction func selectGreenCarButtonTapped(_ sender: Any) {
        ViewController.user.userCarImageName = "green-car-image"
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.userKey)
        } catch {
            print(error)
        }
    }
    
    @IBAction func selectSkyCarButtonTapped(_ sender: Any) {
        ViewController.user.userCarImageName = "sky-car-image"
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.userKey)
        } catch {
            print(error)
        }
    }
    
    @IBAction func selectPurpleCarButtonTapped(_ sender: Any) {
        ViewController.user.userCarImageName = "purple-car-image"
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.userKey)
        } catch {
            print(error)
        }
    }
    
    @IBAction func selectBlueCarButtonTapped(_ sender: Any) {
        ViewController.user.userCarImageName = "blue-car-image"
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.userKey)
        } catch {
            print(error)
        }
    }
    
    @IBAction func selectBlackCarButtonTapped(_ sender: Any) {
        ViewController.user.userCarImageName = "black-car-image"
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.userKey)
        } catch {
            print(error)
        }
    }
    
    @IBAction func setObstacleStubButtonPressed(_ sender: Any) {
        ViewController.user.userObstacleImageName = "stub-image"
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.userKey)
        } catch {
            print(error)
        }
    }
    
    @IBAction func setObstacleRockButtonPressed(_ sender: Any) {
        ViewController.user.userObstacleImageName = "rock-image"
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.userKey)
        } catch {
            print(error)
        }
    }
    
    @IBAction func setObstacleLoguttonPressed(_ sender: Any) {
        ViewController.user.userObstacleImageName = "log-image"
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.userKey)
        } catch {
            print(error)
        }
    }
    
    @IBAction func setUserNameButtonPressed(_ sender: Any) {
        if let name = userNameTextField.text {
            ViewController.user.userName = name
        }
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.userKey)
        } catch {
            print(error)
        }
        print("name from class: \(ViewController.user.userName)")
    }
    
    @IBAction func selectSlowSpeedButtonTapped(_ sender: Any) {
        ViewController.user.userSpeedCar = 16
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.userKey)
        } catch {
            print(error)
        }
        
    }
    
    @IBAction func selectNormalSpeedButtonTapped(_ sender: Any) {
        ViewController.user.userSpeedCar = 8
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.userKey)
        } catch {
            print(error)
        }
    }
    
    @IBAction func selectFastSpeedButtonTapped(_ sender: Any) {
        ViewController.user.userSpeedCar = 4
        do {
            let data = try JSONEncoder().encode(ViewController.user)
            UserDefaults.standard.setValue(data, forKey: UserDefaultsKeys.userKey)
        } catch {
            print(error)
        }
    }
    
}
