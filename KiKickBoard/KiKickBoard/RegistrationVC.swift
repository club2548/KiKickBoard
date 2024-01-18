//
//  RegistrationVC.swift
//  KiKickBoard
//
//  Created by t2023-m0099 on 1/17/24.
//
import Foundation
import UIKit
import SnapKit

class RegistrationVC: UIViewController {
    
    private let registrationVC = UITableView()
    
    var registrationData: [String] = ["Serial Number", "더미", "더미"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(registrationVC)
        registrationAutoLayout()
        
        registrationVC.dataSource = self
        registrationVC.delegate = self
        registrationVC.register(RegistrationCell.self, forCellReuseIdentifier: RegistrationCell.RRidenti)
        
    }
    
    func registrationAutoLayout() {
        registrationVC.snp.makeConstraints{ make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


extension RegistrationVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registrationData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RegistrationCell.RRidenti, for: indexPath) as? RegistrationCell else { return UITableViewCell()}
        
        let models = registrationData[indexPath.row]
        cell.registrationLabel.text = models
        
        //삭제 버튼
        let deleteButton = UIButton(type: .system)
        deleteButton.setTitle("삭제", for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
        
        //버튼을 view에 추가
        cell.contentView.addSubview(deleteButton)
        
        //버튼 설정
        deleteButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.width.equalTo(30)
        }
        
        //label 설정
        cell.registrationLabel.textColor = .darkGray
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        guard let cell = sender.superview?.superview as? RegistrationCell,
              let indexPath = registrationVC.indexPath(for: cell) else { return }
            
        //데이터 삭제
        //registrationData.remove(at: indexPath.row)
        //registrationVC.deleteRows(at: [indexpath], with: .automatic)
        
//        tasks[indexPath.section].list.remove(at: indexPath.row)
//        let userDefaults = UserDefaults.standard
//        userDefaults.removeObject(forKey: "tasks")
    }
}
