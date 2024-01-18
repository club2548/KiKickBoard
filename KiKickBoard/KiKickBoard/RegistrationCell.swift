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
    
    var registrationLabel: UILabel = {
        let registrationLabel = UILabel()
        return registrationLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: RegistrationCell.RRidenti)
        
        addSubview(registrationLabel)
        HistoryAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func HistoryAutoLayout() {
        registrationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
}
