//
//  ViewController.swift
//  timerApp
//
//  Created by 河村健太 on 2020/08/09.
//  Copyright © 2020 franzApp. All rights reserved.
//

import UIKit
import TinyConstraints

class StopWatchViewController: UIViewController {
    let timerLabel = UILabel()
    let startButton = UIButton()
    let stopButton = UIButton()
    let rapTable = UITableView()
    
    let mainBoundSize = UIScreen.main.bounds.size
    
    var rapTimeList = [1,3,4]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubViews()
    }
    
    func setupSubViews() {
        view.addSubview(timerLabel)
        view.addSubview(startButton)
        view.addSubview(stopButton)
        view.addSubview(rapTable)
        
        timerLabel.edgesToSuperview(insets: TinyEdgeInsets(top: 20, left: 50, bottom: mainBoundSize.height/4, right: 50))
        timerLabel.text = "じかん"
        timerLabel.textAlignment = NSTextAlignment.center
        
        rapTable.edgesToSuperview(insets: TinyEdgeInsets(top: mainBoundSize.height/2, left: 0, bottom: 0, right: 0))
        rapTable.delegate = self
        rapTable.dataSource = self
        rapTable.register(UINib(nibName: "RapTimeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}

extension StopWatchViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rapTimeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RapTimeTableViewCell
        cell.congiger(num: rapTimeList[indexPath.row])
        return cell
    }
    
}




