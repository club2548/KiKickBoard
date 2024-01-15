//
//  HomeVC.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/15.
//

import UIKit
import SnapKit
class HomeVC: UIViewController {
    private lazy var tabBarTitleLabel : UILabel = { // 어떤 화면인지에 대한 설명 Label
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Home"
        label.textAlignment = .left
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubViews()
        setAutoLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
}
extension HomeVC {
    private func addSubViews(){
        self.view.addSubview(tabBarTitleLabel)
    }
    private func setAutoLayout(){
        tabBarTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
    }
}
