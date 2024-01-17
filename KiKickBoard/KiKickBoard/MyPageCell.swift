//
//  MyPageCell.swift
//  KiKickBoard
//
//  Created by t2023-m0099 on 1/16/24.
//

import Foundation
import UIKit
import SnapKit

class MyPageCell: UICollectionViewCell {
    static let MPCidenti = "MyPageCell"
    
        var profileLabel: UILabel = { //회원정보
            let profileLabel = UILabel()
            profileLabel.text = "회원정보"
            profileLabel.textAlignment = .left
            profileLabel.textColor = .black
            
            return profileLabel
        }()
        
        var historyLabel: UILabel = { //이용내역
            let historyLabel = UILabel()
            historyLabel.text = "이용내역"
            historyLabel.textAlignment = .left
            historyLabel.textColor = .black
            
            return historyLabel
        }()
        
        var registrationLabel: UILabel = { //등록한 킥보드
            let registrationLabel = UILabel()
            registrationLabel.text = "등록한 킥보드"
            registrationLabel.textAlignment = .left
            registrationLabel.textColor = .black
            
            return registrationLabel
        }()
        
        var logoutLabel: UILabel = { //로그아웃
            let logoutLabel = UILabel()
            logoutLabel.textAlignment = .left
            logoutLabel.textColor = .black
            
            return logoutLabel
        }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        myPageContentView()
        myPageAutoLayout()
        //셀 모서리 둥글게
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func myPageAutoLayout(){ //오토레이아웃
        
        profileLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        historyLabel.snp.makeConstraints { make in
            make.top.equalTo(profileLabel.snp.bottom).offset(10)
            make.leading.equalTo(profileLabel)
            make.trailing.equalTo(profileLabel)
        }
        registrationLabel.snp.makeConstraints { make in
            make.top.equalTo(historyLabel.snp.bottom).offset(10)
            make.leading.equalTo(profileLabel)
            make.trailing.equalTo(profileLabel)
        }
        logoutLabel.snp.makeConstraints { make in
            make.top.equalTo(registrationLabel.snp.bottom).offset(10)
            make.leading.equalTo(profileLabel)
            make.trailing.equalTo(profileLabel)
            make.bottom.lessThanOrEqualToSuperview().offset(-10)
        }
    }
    
    func myPageContentView() {
        addSubview(profileLabel)
        addSubview(historyLabel)
        addSubview(registrationLabel)
        addSubview(logoutLabel)
    }
    
}
