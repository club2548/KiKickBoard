import UIKit
import SnapKit
import NMapsMap


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
    
    private lazy var button: UIButton =  {
        let button = UIButton()
        button.setTitle("등록하기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 25 // 둥근 모서리
        button.layer.borderWidth = 1 // 테두리 선
        button.layer.borderColor = UIColor.systemBlue.cgColor // 데두리 색상
        return button
    }()
    
    private lazy var naverMapView: NMFNaverMapView = {
        let mapView = NMFNaverMapView()
        mapView.showLocationButton = true
        return mapView
    }()
    
    var selectedPosition: NMGLatLng?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        naverMapView.mapView.touchDelegate = self
        addSubViews()
        autoLayouts()
        
        button.addTarget(self, action: #selector(registerButton(_:)), for: .touchUpInside)
        
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
        marker.mapView = mapView // 마커를 지도에 추가
        selectedPosition = latlng
        print("\(latlng.lat), \(latlng.lng)")
    }
    
    // 등록하기 버튼 클릭시 동작.
    @objc func registerButton(_ sender: UIButton) {
        let serialNumber = serialNumber()
        let baseRate = baseRateTextField.text ?? ""
        let extraFee = extraFeeTextField.text ?? ""
        guard let position = selectedPosition else {
            let alert = UIAlertController(title: "킥보드 위치 미등록", message: "등록할 킥보드의 위치를 선택해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            present(alert, animated: true)
            return
        }
        let kickboard = KickBoardInfo(serialNumber: serialNumber, baseRate: baseRate, extraFee: extraFee, position: selectedPosition!)
        // 킥보드정보 객체를 저장
        KickBoardData.shared.kickboards.append(kickboard)
        print("시리얼 넘버: \(serialNumber)")
        print("기본요금: \(baseRate)")
        print("추가요금: \(extraFee)")
        print("위치: \(position.lat), \(position.lng)")
    }
    
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
        
        naverMapView.snp.makeConstraints { make in
            
            make.top.equalTo(eLLabel.snp.bottom).offset(20)
            make.left.right.equalTo(view).inset(20) // 좌우 여백 설정
            make.bottom.equalTo(button.snp.top).offset(-20) // 버튼 위에 위치
        }
    }
    
    
//    func addSubViews(_ views : [UIView]){
//        _ = views.map{self.addSubview($0)}
//    }
    
    
    func addSubViews() {
        let views = [
            baseRateLabel, baseRateTextField, extraFeeLabel, extraFeeTextField, registerTitlelabel, eLLabel, button, naverMapView
        ]
        
        _ = views.map { view.addSubview($0)}
      
    }
}



extension RegisterVC {
    
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
