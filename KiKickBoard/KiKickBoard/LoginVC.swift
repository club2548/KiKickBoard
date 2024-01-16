//
//  LoginVC.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/15.
//

import UIKit
import SnapKit

class LoginVC: UIViewController {
    
    let mainImage = UIImageView(image: UIImage(named: "KiKickBoard_Logo"))
    
    let logInStr : UILabel = {
        let str = UILabel()
        str.font = .boldSystemFont(ofSize: 40)
        str.textColor = .black
        str.text = "Log In"
        str.textAlignment = .left
        return str
    }()
    
    let uIDTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "ID"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let uPWTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let logInBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .gray
        btn.setTitle("Sign In", for: .normal)
        return btn
    }()
    
    let signUPBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .gray
        btn.setTitle("Sign Up", for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        autoLayout()
        setupInteraction()
    }
    
    private func addSubView() {
        self.view.addSubview(mainImage)
        self.view.addSubview(logInStr)
        self.view.addSubview(uIDTextField)
        self.view.addSubview(uPWTextField)
        self.view.addSubview(logInBtn)
        self.view.addSubview(signUPBtn)
    }
    
    private func autoLayout() {
        mainImage.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(80)
            make.right.equalToSuperview().offset(-80)
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(mainImage.snp.width).multipliedBy(584.0 / 730.0)
        }
        
        logInStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(mainImage.snp.bottom).offset(50)
        }
        
        uIDTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(logInStr.snp.bottom).offset(50)
        }
        
        uPWTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(uIDTextField.snp.bottom).offset(50)
        }
        
        logInBtn.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(uPWTextField.snp.bottom).offset(50)
        }
        
        signUPBtn.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(logInBtn.snp.bottom).offset(50)
        }
    }
    
    private func setupInteraction() {
        logInBtn.addTarget(self, action: #selector(touchSignIn), for: .touchUpInside)
        signUPBtn.addTarget(self, action: #selector(touchSignUP), for: .touchUpInside)
    }

    @objc func touchSignIn() {
        
    }
    
    @objc func touchSignUP() {
        self.navigationController?.pushViewController(SignUpVC(), animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

