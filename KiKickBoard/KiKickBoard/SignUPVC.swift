//
//  SignUPVC.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/15.
//

import UIKit

class SignUPVC: UIViewController {
    
    let idStr : UILabel = {
        let str = UILabel()
        str.font = .boldSystemFont(ofSize: 15)
        str.textColor = .black
        str.text = "아이디"
        str.textAlignment = .left
        return str
    }()
    
    let idSignUPTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "알파벳 소문자, 숫자 5~12자"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let pwStr : UILabel = {
        let str = UILabel()
        str.font = .boldSystemFont(ofSize: 15)
        str.textColor = .black
        str.text = "비밀번호"
        str.textAlignment = .left
        return str
    }()
    
    let pwSignUPTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "알파벳 소문자, 특수문자 필수 8~16자"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let eMailStr : UILabel = {
        let str = UILabel()
        str.font = .boldSystemFont(ofSize: 15)
        str.textColor = .black
        str.text = "이메일"
        str.textAlignment = .left
        return str
    }()
    
    let eMailSignUPTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "abcdegf@KiKickBoard.com"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let nameStr : UILabel = {
        let str = UILabel()
        str.font = .boldSystemFont(ofSize: 15)
        str.textColor = .black
        str.text = "이름"
        str.textAlignment = .left
        return str
    }()
    
    let nameSignUPTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "박보검"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let mobileStr : UILabel = {
        let str = UILabel()
        str.font = .boldSystemFont(ofSize: 15)
        str.textColor = .black
        str.text = "전화번호"
        str.textAlignment = .left
        return str
    }()
    
    let mobileSignUPTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "-없이 입력"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let joinBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .gray
        btn.setTitle("JOIN", for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        autoLayout()
        setupInteraction()

        // Do any additional setup after loading the view.
    }
    
    private func addSubView() {
        self.view.addSubview(idStr)
        self.view.addSubview(idSignUPTextField)
        self.view.addSubview(pwStr)
        self.view.addSubview(pwSignUPTextField)
        self.view.addSubview(eMailStr)
        self.view.addSubview(eMailSignUPTextField)
        self.view.addSubview(nameStr)
        self.view.addSubview(nameSignUPTextField)
        self.view.addSubview(mobileStr)
        self.view.addSubview(mobileSignUPTextField)
        self.view.addSubview(joinBtn)
    }
    
    private func autoLayout() {
        idStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(150)
        }
        idSignUPTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(idStr.snp.bottom).offset(10)
        }
        pwStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(idSignUPTextField.snp.bottom).offset(30)
        }
        pwSignUPTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(pwStr.snp.bottom).offset(10)
        }
        eMailStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(pwSignUPTextField.snp.bottom).offset(30)
        }
        eMailSignUPTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(eMailStr.snp.bottom).offset(10)
        }
        nameStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(eMailSignUPTextField.snp.bottom).offset(30)
        }
        nameSignUPTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(nameStr.snp.bottom).offset(10)
        }
        mobileStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(nameSignUPTextField.snp.bottom).offset(30)
        }
        mobileSignUPTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(mobileStr.snp.bottom).offset(10)
        }
        joinBtn.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(mobileSignUPTextField.snp.bottom).offset(50)
        }
    }
    
    private func setupInteraction() {
        joinBtn.addTarget(self, action: #selector(touchJoin), for: .touchUpInside)
    }

    @objc func touchJoin() {
        
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
