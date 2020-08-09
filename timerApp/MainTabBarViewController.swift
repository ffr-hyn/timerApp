//
//  MainTabBarViewController.swift
//  timerApp
//
//  Created by 河村健太 on 2020/08/09.
//  Copyright © 2020 franzApp. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let stopWatchViewController = StopWatchViewController()
        let alarmViewController = AlarmViewController()
        stopWatchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 0)
        alarmViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        viewControllers = [stopWatchViewController, alarmViewController]
    }
}
