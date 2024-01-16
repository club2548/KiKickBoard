import UIKit
import SnapKit



class RegisterVC: UIViewController {
    
    
    // 타이틀 라벨
    let registerTitlelabel: UILabel = {
        let label = UILabel()
        label.text = "KiKickBoard 등록하기"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    // 기본 요금 라벨/텍스트필드
    let baseRateLabel: UILabel = {
        let label = UILabel()
        label.text = "기본 요금 (1km)"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let baseRateTextField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "1km 이내를 이동하는 기본요금을 설정합니다."
        return field
    }()
    
    // 추가 요금 라벨/텍스트필드
    let extraFeeLabel: UILabel = {
        let label = UILabel()
        label.text = "추가 요금 (100m)"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    let extraFeeTextField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "1km를 초과한 후 100m당 요금을 설정합니다. "
        return field
    }()
    // Equipment location 기기위치 라벨
    let eLLabel: UILabel = {
        let eLocationLabel = UILabel()
        eLocationLabel.numberOfLines = 2
        eLocationLabel.textAlignment = .left
        
        let boldFont = UIFont.boldSystemFont(ofSize: 18)
        let regularFont = UIFont.systemFont(ofSize: 14)
        
        let boldText = NSAttributedString(string: "기기위치\n", attributes: [.font: boldFont])
        let regularText = NSAttributedString(string: "추가하고자 하는 KiKickBoard의 위치를 설정하세요.", attributes: [.font: regularFont])
        let combinedText = NSMutableAttributedString(attributedString: boldText)
        combinedText.append(regularText)
        
        eLocationLabel.attributedText = combinedText
        return eLocationLabel
    }()
    
    let button: UIButton =  {
        let button = UIButton()
        button.setTitle("등록하기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 25 // 둥근 모서리
        button.layer.borderWidth = 1 // 테두리 선
        button.layer.borderColor = UIColor.systemBlue.cgColor // 데두리 색상
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        addSubViews()
        autoLayouts()
        
        button.addTarget(self, action: #selector(registerButton(_:)), for: .touchUpInside)
        
    }
    
    
    
    
    // 등록하기 버튼 클릭시 동작.
    @objc func registerButton(_ sender: UIButton) {
        
    }
    
}

// 등록하기 화면 UI
extension RegisterVC {
    func autoLayouts() {
        
        registerTitlelabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        
        baseRateLabel.snp.makeConstraints { make in
            make.top.equalTo(registerTitlelabel.snp.bottom).offset(20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        
        baseRateTextField.snp.makeConstraints { make in
            make.top.equalTo(baseRateLabel.snp.bottom).offset(20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        
        extraFeeLabel.snp.makeConstraints { make in
            make.top.equalTo(baseRateTextField.snp.bottom).offset(20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        
        extraFeeTextField.snp.makeConstraints { make in
            make.top.equalTo(extraFeeLabel.snp.bottom).offset(20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        
        eLLabel.snp.makeConstraints { make in
            make.top.equalTo(extraFeeTextField.snp.bottom).offset(40)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalTo(view) // 가로축에서 중앙 정렬
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        
    }
    
    
//    func addSubViews(_ views : [UIView]){
//        _ = views.map{self.addSubview($0)}
//    }
    
    
    func addSubViews() {
        view.addSubview(baseRateLabel)
        view.addSubview(baseRateTextField)
        view.addSubview(extraFeeLabel)
        view.addSubview(extraFeeTextField)
        view.addSubview(registerTitlelabel)
        view.addSubview(eLLabel)
        view.addSubview(button)
    }
}





//// MARK: -Pre View
//import SwiftUI
//
//
//struct PreView: PreviewProvider {
//    static var previews: some View {
//        UINavigationController(rootViewController: RegisterVC()).toPreview()
//    }
//}
//
//
//#if DEBUG
//extension UIViewController {
//    private struct Preview: UIViewControllerRepresentable {
//            let viewController: UIViewController
//
//            func makeUIViewController(context: Context) -> UIViewController {
//                return viewController
//            }
//
//            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//            }
//        }
//
//        func toPreview() -> some View {
//            Preview(viewController: self)
//        }
//}
//#endif
