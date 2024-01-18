//
//  ProfileVC.swift
//  KiKickBoard
//
//  Created by t2023-m0099 on 1/17/24.
//
import Foundation
import UIKit
import SnapKit


class ProfileVC: UIViewController {
    //private 선언을 잘하자
    private let profileVC = UITableView()
    var profileData: [String] = ["아이디", "비밀번호", "이름", "전화번호", "이메일"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(profileVC)
        
        profileAutoLayout()
        
        profileVC.dataSource = self
        profileVC.delegate = self
        profileVC.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.PFCidenti)
        
        profileVC.backgroundColor = .purple
    }
    
    func profileAutoLayout() {
        profileVC.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}


extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return profileData.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.PFCidenti, for: indexPath) as? ProfileCell else { return UITableViewCell() }
    
    let models = profileData[indexPath.row]
    cell.profileCellLabel.text = models
    
    cell.backgroundColor = .clear
    cell.selectionStyle = .none
    
    return cell
}

}
