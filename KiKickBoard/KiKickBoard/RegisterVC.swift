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
        field.placeholder = ""
        return field
    }()
    
    // 추가 요금 라벨/텍스트필드
    let extraFeeLabel: UILabel = {
        let label = UILabel()
        label.text = "추가 요금 (100m당)"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    let extraFeeTextField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = ""
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
    
    @objc func registerButton(_ sender: UIButton) {
        
    }
    
}







// MARK: -Pre View
import SwiftUI


struct PreView: PreviewProvider {
    static var previews: some View {
        UINavigationController(rootViewController: RegisterVC()).toPreview()
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
