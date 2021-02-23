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
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = UserDefaults.standard.value(forKey: "UserKey") as? Data {
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                ViewController.user = user
            } catch {
                print(error)
                ViewController.user = User(userName: "Default name",
                                           userObstacleImageName: "stub-image",
                                           userCarImageName: "red-car-image",
                                           userSpeedCar: 16)
            }
        } else {
            ViewController.user = User(userName: "Default name",
                                       userObstacleImageName: "stub-image",
                                       userCarImageName: "red-car-image",
                                       userSpeedCar: 16)
        }
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleKeyboardDidShow(_:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleKeyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func onBackButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func selectCarColor() {
        
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

    @objc func handleKeyboardWillHide () {
        scrollView.contentInset = .zero
    }

    @objc func handleKeyboardDidShow (_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let bottomInset = keyboardFrame.height
            let insets = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
            scrollView.contentInset = insets
        }
    }

}
