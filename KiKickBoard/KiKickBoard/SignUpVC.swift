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
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let idDescription : UILabel = {
        let description = UILabel()
        description.font = .systemFont(ofSize: 12)
        description.textColor = .red
        description.textAlignment = .left
        return description
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
        textField.autocapitalizationType = .none
        return textField
    }()
    
    var eyeButton = UIButton(type: .custom)
    
    let pwDescription : UILabel = {
        let description = UILabel()
        description.font = .systemFont(ofSize: 12)
        description.textColor = .red
        description.textAlignment = .left
        return description
    }()
    
    let pwCheckStr : UILabel = {
        let str = UILabel()
        str.font = .boldSystemFont(ofSize: 15)
        str.textColor = .black
        str.text = "비밀번호 확인"
        str.textAlignment = .left
        return str
    }()
    
    let pwSignUpCheckTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 다시 입력해주세요"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let pwCheckDescription : UILabel = {
        let description = UILabel()
        description.font = .systemFont(ofSize: 12)
        description.textColor = .red
        description.textAlignment = .left
        return description
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
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let eMailCheckDescription : UILabel = {
        let description = UILabel()
        description.font = .systemFont(ofSize: 12)
        description.textColor = .red
        description.textAlignment = .left
        return description
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
        textField.autocapitalizationType = .none
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
        textField.autocapitalizationType = .none
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
        setEyeButton()
//        idValidCheck()
    }
}


// MARK: extention of SignUpVC - addSubView, autoLayout, interaction etc.
extension SignUpVC {
    private func addSubView() {
        self.view.addSubViews([idStr, idSignUpTextField, idDescription,pwStr, pwSignUpTextField, pwDescription,pwCheckStr, pwSignUpCheckTextField,pwCheckDescription,eMailStr, eMailSignUpTextField, eMailCheckDescription,nameStr, nameSignUpTextField, mobileStr, mobileSignUpTextField, joinBtn])
    }
    
    private func autoLayout() {
        idStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalToSuperview().offset(150)
        }
        idSignUpTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(idStr.snp.bottom).offset(5)
        }
        idDescription.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(idSignUpTextField.snp.bottom).offset(5)
        }
        pwStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(idSignUpTextField.snp.bottom).offset(35)
        }
        pwSignUpTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(pwStr.snp.bottom).offset(5)
        }
        pwDescription.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(pwSignUpTextField.snp.bottom).offset(5)
        }
        pwCheckStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(pwSignUpTextField.snp.bottom).offset(35)
        }
        pwSignUpCheckTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(pwCheckStr.snp.bottom).offset(5)
        }
        pwCheckDescription.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(pwSignUpCheckTextField.snp.bottom).offset(5)
        }
        eMailStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(pwSignUpCheckTextField.snp.bottom).offset(35)
        }
        eMailSignUpTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(eMailStr.snp.bottom).offset(5)
        }
        eMailCheckDescription.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(eMailSignUpTextField.snp.bottom).offset(5)
        }
        nameStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(eMailSignUpTextField.snp.bottom).offset(35)
        }
        nameSignUpTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(nameStr.snp.bottom).offset(5)
        }
        mobileStr.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(nameSignUpTextField.snp.bottom).offset(35)
        }
        mobileSignUpTextField.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(mobileStr.snp.bottom).offset(5)
        }
        joinBtn.snp.makeConstraints() { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(mobileSignUpTextField.snp.bottom).offset(50)
        }
    }
    
    private func setupInteraction() {
        joinBtn.addTarget(self, action: #selector(touchJoin), for: .touchUpInside)
        idSignUpTextField.addTarget(self, action: #selector(idValidCheck), for: .editingChanged)
        pwSignUpTextField.addTarget(self, action: #selector(pwValidCheck), for: .editingChanged)
        pwSignUpCheckTextField.addTarget(self, action: #selector(pwEqualCheck), for: .editingChanged)
        eMailSignUpTextField.addTarget(self, action: #selector(eMailValidCheck), for: .editingChanged)
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
    
    @objc func idValidCheck() {
        idDescription.isHidden = false
        
        let minCount = 5
        let maxCount = 12
        let count = idSignUpTextField.text!.count
        
        switch count {
        case 0 :
            idDescription.text = "아이디는 필수입력 정보입니다."
        case 1..<minCount :
            idDescription.text = "아이디는 5글자 이상이어야 합니다."
        case minCount..<maxCount :
            let idPattern = "^[a-z0-9-_]{\(minCount),\(maxCount)}$"
            let isValidPattern = (idSignUpTextField.text!.range(of: idPattern, options: .regularExpression) != nil)
            if isValidPattern {
                idDescription.text = "조건에 맞는 아이디"
                idDescription.isHidden = true
            } else {
                idDescription.text = "소문자, 숫자, 빼기(-), 밑줄(_)만 사용할 수 있습니다."
            }
        default :
            idDescription.text = "아이디는 12글자 이하여야 합니다."
        }
        
    }
    
    @objc func pwValidCheck() {
        pwDescription.isHidden = false
        
        let minCount = 5
        let maxCount = 12
        let count = pwSignUpTextField.text!.count
        
        switch count {
        case 0 :
            pwDescription.text = "아이디는 필수입력 정보입니다."
        case 1..<minCount :
            pwDescription.text = "아이디는 5글자 이상이어야 합니다."
        case minCount..<maxCount :
            let pwPattern = "^[a-z0-9-_]{\(minCount),\(maxCount)}$"
            let isValidPattern = (pwSignUpTextField.text!.range(of: pwPattern, options: .regularExpression) != nil)
            if isValidPattern {
                pwDescription.text = "조건에 맞는 아이디"
                pwDescription.isHidden = true
            } else {
                pwDescription.text = "소문자, 숫자, 빼기(-), 밑줄(_)만 사용할 수 있습니다."
            }
        default :
            pwDescription.text = "아이디는 12글자 이하여야 합니다."
        }
        
    }
    @objc func pwEqualCheck() {
        pwCheckDescription.isHidden = false
        let count = pwSignUpCheckTextField.text!.count
        
        switch pwSignUpCheckTextField.text {
        case pwSignUpTextField.text :
            pwCheckDescription.text = "비밀번호가 일치합니다."
            pwCheckDescription.textColor = .blue
        default :
            pwCheckDescription.text = "비밀번호가 일치하지 않습니다."
        }
        
    }
    @objc func eMailValidCheck() {
        eMailCheckDescription.isHidden = false

        let count = eMailSignUpTextField.text!.count
        let eMailPattern = "^[a-zA-Z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$"
        let isValidPattern = (eMailSignUpTextField.text!.range(of: eMailPattern, options: .regularExpression) != nil)
        
        switch isValidPattern {
        case true :
            eMailCheckDescription.text = ""
        default :
            eMailCheckDescription.text = "정상적인 이메일 주소가 아닙니다."
        }
        
    }
    
    private func setEyeButton() {
        eyeButton = UIButton(type: .custom)
        
        let imageSize = CGSize(width: 20, height: 20)
        
        eyeButton.setImage(UIImage(named: "password-hide")?.resized(to: imageSize), for: .selected)
        eyeButton.setImage(UIImage(named: "password-view")?.resized(to: imageSize), for: .normal)
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        
        self.eyeButton.configuration = buttonConfiguration

        self.pwSignUpTextField.rightView = eyeButton
        self.pwSignUpTextField.rightViewMode = .always
        
        pwSignUpTextField.isSecureTextEntry = true
        
        eyeButton.addAction(UIAction(handler: {[self] _ in
            pwSignUpTextField.isSecureTextEntry.toggle()
            self.eyeButton.isSelected.toggle()
        }), for: .touchUpInside)
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

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
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
