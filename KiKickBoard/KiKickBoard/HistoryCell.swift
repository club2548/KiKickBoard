//
//  HistoryCell.swift
//  KiKickBoard
//
//  Created by t2023-m0099 on 1/18/24.
//
import Foundation
import UIKit
import SnapKit

class HistoryCell: UITableViewCell {
    static let HTidenti = "HTCell"
    
    var historyCellLabel: UILabel = {
        let historyCellLabel = UILabel()
        return historyCellLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: HistoryCell.HTidenti)
        
        addSubview(historyCellLabel)
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
        historyCellLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-10)
        }
        
    }
}
