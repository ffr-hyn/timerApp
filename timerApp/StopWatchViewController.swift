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
    let resetButton = UIButton()
    let rapTable = UITableView()
    var timer = Timer()
    var dispTime = 0
    
    let mainBoundSize = UIScreen.main.bounds.size
    
    var rapTimeList = [1,3,4]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupSubViews()
    }
    
    func setupSubViews() {
        view.addSubview(timerLabel)
        view.addSubview(startButton)
        view.addSubview(stopButton)
        view.addSubview(resetButton)
        view.addSubview(rapTable)
        
        timerLabel.centerX(to: view)
        timerLabel.topToSuperview(offset: mainBoundSize.height/4)
        timerLabel.text = "じかん"
        timerLabel.textAlignment = NSTextAlignment.center
        timerLabel.textColor = .white
        
        startButton.trailingToSuperview(offset: 50)
        startButton.bottomToTop(of: rapTable, offset: -20)
        startButton.size(.init(width: 100, height: 100))
        startButton.layer.cornerRadius = 50
        startButton.clipsToBounds = true
        startButton.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        startButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        
        resetButton.leadingToSuperview(offset: 50)
        resetButton.bottomToTop(of: rapTable, offset: -20)
        resetButton.size(.init(width: 100, height: 100))
        resetButton.layer.cornerRadius = 50
        resetButton.clipsToBounds = true
        resetButton.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        
        rapTable.edgesToSuperview(insets: TinyEdgeInsets(top: mainBoundSize.height/2, left: 0, bottom: 0, right: 0))
        rapTable.delegate = self
        rapTable.dataSource = self
        rapTable.backgroundColor = .black
        rapTable.separatorColor = .darkGray
        rapTable.register(UINib(nibName: "RapTimeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    @objc private func startTimer() {
        startButton.isHidden = true
        stopButton.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(countTime),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc private func stopTimer() {
        startButton.isHidden = false
        stopButton.isHidden = true
    }
    
    @objc private func resetTimer() {
        timer.invalidate()
        dispTime = 0
        updateTime()
    }
    
    @objc private func countTime() {
        dispTime += 1
        updateTime()
    }
    
    private func updateTime() {
        timerLabel.text = "\(dispTime)"
        
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




