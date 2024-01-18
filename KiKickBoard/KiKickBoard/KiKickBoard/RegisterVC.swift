import UIKit
import SnapKit
import NMapsMap

// dev
class RegisterVC: UIViewController, NMFMapViewTouchDelegate {
    // 타이틀 라벨
    private lazy var registerTitlelabel: UILabel = {
        let label = UILabel()
        label.text = "KiKickBoard 등록하기"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    // 기본 요금 라벨/텍스트필드
    private lazy var baseRateLabel: UILabel = {
        let label = UILabel()
        label.text = "기본 요금 (1km)"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var baseRateTextField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "1km 이내를 이동하는 기본요금을 설정합니다."
        field.keyboardType = .numberPad // 숫자패드
        return field
    }()
    
    // 추가 요금 라벨/텍스트필드
    private lazy var extraFeeLabel: UILabel = {
        let label = UILabel()
        label.text = "추가 요금 (100m)"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    private lazy var extraFeeTextField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "1km를 초과한 후 100m당 요금을 설정합니다. "
        field.keyboardType = .numberPad //숫자패드
        return field
    }()
    // Equipment location 기기위치 라벨
    private lazy var eLLabel: UILabel = {
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
    
    
    private lazy var naverMapView: NMFNaverMapView = {
        let mapView = NMFNaverMapView()
        mapView.showLocationButton = true
        return mapView
    }()
    
    private lazy var baseRateCheckLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "*기본요금을 입력해주세요"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    private lazy var extraFeeCheckLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = "*추가요금을 입력해주세요"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        naverMapView.mapView.touchDelegate = self
        baseRateTextField.delegate = self
        extraFeeTextField.delegate = self
        
        addSubViews()
        autoLayouts()
    }
    
    // 텍스트필드에 키보드 동작 후 화면 터치 이벤트로 다시 숨기기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // 마커 설정.
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        let marker = NMFMarker()
        marker.position = latlng
        marker.iconImage = NMFOverlayImage(name: "KickBoardImg")
        marker.width = 30
        marker.height = 30
//        marker.mapView = mapView // 마커를 지도에 추가

        print("\(latlng.lat), \(latlng.lng)")
        if self.confirmPrice() {
            showAlert(marker)
        }
        
    }
    
    func showAlert(_ marker: NMFMarker) {
        let serialNumber = serialNumber()
        let baseRate = baseRateTextField.text ?? ""
        let extraFee = extraFeeTextField.text ?? ""
        let alertMassage = """
            선택하신 킥보드 정보는 다음과 같습니다:
            - 시리얼 번호: \(serialNumber)
            - 기본 요금: \(baseRate)원
            - 추가 요금: \(extraFee)원
            - 위치: \(marker.position.lat), \(marker.position.lng)

            위 정보가 맞으신가요?
            """
        let alert = UIAlertController(title: "킥보드 정보 확인", message: alertMassage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "확인", style: .default) { _ in
            let kickboard = KickBoardInfo(serialNumber: serialNumber, baseRate: baseRate, extraFee: extraFee, position: marker.position, markerInfo: marker )
            
            // 킥보드정보 객체 저장
            KickBoardData.shared.kickboards.append(kickboard)
            marker.mapView = self.naverMapView.mapView
            
            print("시리얼 넘버: \(serialNumber)")
            print("기본요금: \(baseRate)")
            print("추가요금: \(extraFee)")
            print("위치: \(marker.position.lat), \(marker.position.lng)")
        })
        present(alert, animated: true, completion: nil)
    }
    
    // 금액 입력 여부확인
    func confirmPrice() -> Bool {
        return !(baseRateTextField.text?.isEmpty ?? true) && !(extraFeeTextField.text?.isEmpty ?? true)
    }
    
    // 시리얼 넘버
    func serialNumber() -> Int {
        return Int.random(in: 10000000...99999999)
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
            make.top.equalTo(baseRateLabel.snp.bottom).offset(10)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        
        baseRateCheckLabel.snp.makeConstraints { make in
            make.top.equalTo(baseRateTextField.snp.bottom).offset(1)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        
        extraFeeLabel.snp.makeConstraints { make in
            make.top.equalTo(baseRateTextField.snp.bottom).offset(30)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        
        extraFeeTextField.snp.makeConstraints { make in
            make.top.equalTo(extraFeeLabel.snp.bottom).offset(10)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        
        eLLabel.snp.makeConstraints { make in
            make.top.equalTo(extraFeeTextField.snp.bottom).offset(40)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        
        extraFeeCheckLabel.snp.makeConstraints { make in
            make.top.equalTo(extraFeeTextField.snp.bottom).offset(1)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        
        naverMapView.snp.makeConstraints { make in
            make.top.equalTo(eLLabel.snp.bottom).offset(10)
            make.left.right.equalTo(view).inset(20) // 좌우 여백 설정
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    
    func addSubViews() {
        let views = [
            baseRateLabel, baseRateTextField, extraFeeLabel, extraFeeTextField, registerTitlelabel, eLLabel, naverMapView, extraFeeCheckLabel, baseRateCheckLabel
        ]
        _ = views.map { view.addSubview($0)}
    }
}



extension RegisterVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let text = textField.text else { return true }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        
        if textField === baseRateTextField {
            if newString.isEmpty {
                baseRateCheckLabel.text = "기본요금을 입력해주세요"
                baseRateCheckLabel.textColor = .red
            } else {
                baseRateCheckLabel.text = "✓"
                baseRateCheckLabel.textColor = .green
            }
        } else if textField === extraFeeTextField {
            if newString.isEmpty {
                extraFeeCheckLabel.text = "추가요금을 입력해주세요"
                extraFeeCheckLabel.textColor = .red
            } else {
                extraFeeCheckLabel.text = "✓"
                extraFeeCheckLabel.textColor = .green
            }
        }
        return true
    }
}


