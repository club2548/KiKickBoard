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
    
    var myPageLabel: UILabel = {
        let profileLabel = UILabel()
        return profileLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(myPageLabel)
        myPageAutoLayout()
        //셀 모서리 둥글게
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func myPageAutoLayout(){ //오토레이아웃
        myPageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
}
