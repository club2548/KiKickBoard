//
//  SignUpVC.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/15.
//

import UIKit

class SignUpVC: UIViewController {
    
    let idStr : UILabel = {
        let str = UILabel()
        str.font = .boldSystemFont(ofSize: 15)
        str.textColor = .black
        str.text = "아이디"
        str.textAlignment = .left
        return str
    }()
    
    let idSignUpTextField : UITextField = {
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
    
    let pwSignUpTextField : UITextField = {
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
    
    let eMailSignUpTextField : UITextField = {
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
    
    let nameSignUpTextField : UITextField = {
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
    
    let mobileSignUpTextField : UITextField = {
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
        self.view.backgroundColor = .white
        addSubView()
        autoLayout()
        setupInteraction()
    }
}


// MARK: extention of SignUpVC - addSubView, autoLayout, interaction etc.
extension SignUpVC {
    private func addSubView() {
        self.view.addSubViews([idStr, idSignUpTextField, pwStr, pwSignUpTextField, eMailStr, eMailSignUpTextField, nameStr, nameSignUpTextField, mobileStr, mobileSignUpTextField, joinBtn])
    }
    
    private func autoLayout() {
        idStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(150)
        }
        idSignUpTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(idStr.snp.bottom).offset(10)
        }
        pwStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(idSignUpTextField.snp.bottom).offset(30)
        }
        pwSignUpTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(pwStr.snp.bottom).offset(10)
        }
        eMailStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(pwSignUpTextField.snp.bottom).offset(30)
        }
        eMailSignUpTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(eMailStr.snp.bottom).offset(10)
        }
        nameStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(eMailSignUpTextField.snp.bottom).offset(30)
        }
        nameSignUpTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(nameStr.snp.bottom).offset(10)
        }
        mobileStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(nameSignUpTextField.snp.bottom).offset(30)
        }
        mobileSignUpTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(mobileStr.snp.bottom).offset(10)
        }
        joinBtn.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(mobileSignUpTextField.snp.bottom).offset(50)
        }
    }
    
    private func setupInteraction() {
        joinBtn.addTarget(self, action: #selector(touchJoin), for: .touchUpInside)
    }
    
    // 사용자 입력 중 아이디, 이메일, 전화번호를 저장된 정보와 확인한 후, 없다면 UserDefaults에 저장.
    @objc func touchJoin() {
        guard let newID = self.idSignUpTextField.text else { return }
        guard let newPW = self.pwSignUpTextField.text else { return }
        guard let newEMail = self.eMailSignUpTextField.text else { return }
        guard let newName = self.nameSignUpTextField.text else { return }
        guard let newMobile = self.mobileSignUpTextField.text else { return }
        
        let newUserInfo = UserInfo(uid: newID, password: newPW, email: newEMail, name: newName, phoneNumber: newMobile)
        
        // newUserInfo의 아이디, 이메일, 전화번호 중 같은 정보가 UserDefaults내 저장된 여부 판단
        if SignUpController.shared.doesUserInfoExist(userInfo: newUserInfo) {
            
            // 있다면, 메세지를 띄우고 이전화면으로.
            showAlert(message: "이미 가입된 정보가 있습니다.", handler: nil)
        } else {
            // 없다면, 입력된 정보 UserDefaults에 저장. alert로 메세지를 띄워주고, 확인을 누르면 HomeVC로 이동.
            SignUpController.shared.userInfoArray.append(newUserInfo)
            SignUpController.shared.saveUserInfoArray()
            SignUpController.shared.readUserInfoArray()
            showAlert(message: "KiKickBoard 가입을 환영합니다!", handler: {_ in
                self.navigationController?.popToRootViewController(animated: true)})
        }

        print("Saved UserInfo : \(SignUpController.shared.userInfoArray)")
    }
    
    private func showAlert(message: String, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: handler))
        present(alert, animated: true, completion: nil)
    }

}

extension UIView{
  func addSubViews(_ views : [UIView]){
    _ = views.map{self.addSubview($0)}
  }
}

// MARK: -Pre View
import SwiftUI
struct PreView: PreviewProvider {
  static var previews: some View {
    UINavigationController(rootViewController: LoginVC()).toPreview()
  }
}
#if DEBUG
extension UIViewController {
  private struct Preview: UIViewControllerRepresentable {
      let viewController: UIViewController
      func makeUIViewController(context: Context) -> UIViewController {
        return viewController
      }
      func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
      }
    }
    func toPreview() -> some View {
      Preview(viewController: self)
    }
}
#endif
