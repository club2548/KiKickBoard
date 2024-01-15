//
//  TabBarController.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/15.
//

import UIKit

class TabBarController: UITabBarController {
    let firstVC = UINavigationController.init(rootViewController: LoginVC())
    var secondVC = UINavigationController.init(rootViewController: HomeVC())
    let thirdVC = UINavigationController.init(rootViewController: RegisterVC())
    let fourthVC = UINavigationController.init(rootViewController: MyPageVC())

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setTabBar()
//        self.tabBar.tintColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    private func setTabBar(){
        self.viewControllers = [firstVC,secondVC,thirdVC,fourthVC]
        firstVC.tabBarItem = UITabBarItem(title: "로그인/회원가입", image: UIImage(systemName: "square.and.pencil.circle"), tag: 1)
        secondVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill"), tag: 2)
        thirdVC.tabBarItem = UITabBarItem(title: "킥보드 등록", image: UIImage(systemName: "plus.app.fill"), tag: 3)
        fourthVC.tabBarItem = UITabBarItem(title: "마이 페이지", image: UIImage(systemName: "person.circle.fill"), tag: 4)
        
    }

}
