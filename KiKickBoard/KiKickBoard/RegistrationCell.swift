//
//  RegistrationCell.swift
//  KiKickBoard
//
//  Created by t2023-m0099 on 1/18/24.
//
import Foundation
import UIKit
import SnapKit

class RegistrationCell: UITableViewCell {
    static let RRidenti = "RRCell"
    var tapDelteClosure : (()->())?
    var registrationLabel: UILabel = {
        let registrationLabel = UILabel()
        registrationLabel.textColor = .darkGray
        return registrationLabel
    }()
    private lazy var deleteButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash.circle"), for: .normal)
        button.tintColor = UIColor.red
        button.isEnabled = true
        button.addTarget(self, action: #selector(tapDeleteButton), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: RegistrationCell.RRidenti)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        contentView.addSubview(registrationLabel)
        contentView.addSubview(deleteButton)
        HistoryAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func HistoryAutoLayout() {
        registrationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-10)
        }
        deleteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(registrationLabel.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-10)
        }
        deleteButton.setContentHuggingPriority(.init(250), for: .horizontal)
        deleteButton.setContentHuggingPriority(.init(251), for: .horizontal)
    }
    @objc func tapDeleteButton(){
        tapDelteClosure?()
    }
}
