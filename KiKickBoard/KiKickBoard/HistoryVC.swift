//
//  HistoryVC.swift
//  KiKickBoard
//
//  Created by t2023-m0099 on 1/17/24.
//
import Foundation
import UIKit
import SnapKit


class HistoryVC: UIViewController {
    
    private let historyVC = UITableView()
    
    //데이터 받아오기. 날짜는 어떻게 받아오지?
    var historyData: [String] = [ "yyyy-MM-dd HH:mm", "Serial Number", "이용 거리" , "거리에 따른 금액"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(historyVC)
        historyAutoLayout()
        
        historyVC.delegate = self
        historyVC.dataSource = self
        historyVC.register(HistoryCell.self, forCellReuseIdentifier: HistoryCell.HTidenti)
    }
    
    func historyAutoLayout() {
        historyVC.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.HTidenti , for: indexPath) as? HistoryCell else { return UITableViewCell() }
        
        let models = historyData[indexPath.row]
        cell.historyCellLabel.text = models
        
        cell.historyCellLabel.textColor = .darkGray
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
    
}
