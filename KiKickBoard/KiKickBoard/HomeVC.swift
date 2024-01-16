//
//  HomeVC.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/15.
//
//test
import UIKit
import SnapKit
import KakaoMapsSDK
class HomeVC: UIViewController{
    
    private lazy var explainLabel : UILabel = { // 상위 설명 Label
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "설명 글"
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    private lazy var addressLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "주소 입력"
        label.textAlignment = .left
        return label
    }()
    private lazy var addressStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    private lazy var addressTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "주소를 입력하세요."
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        return textField
    }()
    private lazy var addressButton : UIButton = {
        let button = UIButton()
        button.setTitle("주소 입력", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    private lazy var mapView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        return view
    }()
    private lazy var rentalButton : UIButton = {
        let button = UIButton()
        button.setTitle("대여하기", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = "Home"
        addSubViews()
        setAutoLayout()
        setExplainLabel()
    }
  
 
}
extension HomeVC {
    private func addSubViews(){
        self.view.addSubview(explainLabel)
        self.view.addSubview(addressLabel)
        self.view.addSubview(addressStackView)
        addressStackView.addArrangedSubview(addressTextField)
        addressStackView.addArrangedSubview(addressButton)
        self.view.addSubview(mapView)
        self.view.addSubview(rentalButton)
    }
    private func setAutoLayout(){
        explainLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(explainLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        addressStackView.snp.makeConstraints { make in
            make.top.equalTo(addressLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        mapView.snp.makeConstraints { make in
            make.top.equalTo(addressStackView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        rentalButton.snp.makeConstraints { make in
            make.top.equalTo(mapView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-15)
        }
    }
    private func setExplainLabel(){ // explainLabel 설정
        let text = "가까운 곳의 킥보드를 찾아보세요.\n대여를 원하는 킥보드를 클릭하세요."
        let attributed = NSMutableAttributedString(string: text)
        // 특정 범위의 글자색과 폰트(크기) 변경
        let range = (text as NSString).range(of: "대여를 원하는 킥보드를 클릭하세요.")
        var attributes: [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor.gray,
            .font : UIFont.systemFont(ofSize: 15)
        ]
        attributed.addAttributes(attributes, range: range)
        // 글자 행간 간격 추가
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        attributes[.paragraphStyle] = paragraphStyle
        attributed.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributed.length))
        explainLabel.attributedText = attributed
    }
    
}



