//
//  HomeVC.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/15.
//
//test
import UIKit
import SnapKit
import NMapsMap
import CoreLocation
class HomeVC: UIViewController{
    var locationManager: CLLocationManager!
    var currentLatitude: Double?
    var currentLongtitude: Double?
    var searchAddress = ""
    let markers : [NMFMarker] = BaseKickBoardData().baseKickBoard
    var retalPostion : NMGLatLng?
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
        textField.addTarget(self, action: #selector(changeTextField(_:)), for: .editingChanged)
        return textField
    }()
    private lazy var addressButton : UIButton = {
        let button = UIButton()
        button.setTitle("주소 입력", for: .normal)
        button.backgroundColor = UIColor(named: "PrimaryColor")
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapMoveAddress), for: .touchUpInside)
        return button
    }()
    private lazy var navermapView : NMFNaverMapView = {
        let mapView = NMFNaverMapView() // 지도 객체 생성
        mapView.showLocationButton = true
        return mapView
    }()
    private lazy var rentalButton : UIButton = {
        let button = UIButton()
        button.setTitle("대여하기", for: .normal)
        button.backgroundColor = UIColor(named: "PrimaryColor")
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapRentalButton), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = "Home"
        addSubViews()
        setAutoLayout()
        setExplainLabel()
        getCurrentLoaction()
        addressTextField.delegate = self
        navermapView.mapView.touchDelegate = self
        for mark in markers{
            mark.touchHandler = { (overlay : NMFOverlay) -> Bool in
                self.retalPostion = mark.position
                print(mark.position)
                print("Mark Touch")
                return true
            }
            mark.anchor = CGPoint(x: 1, y: 1)
            mark.mapView = self.navermapView.mapView
        }
    }
}
extension HomeVC : CLLocationManagerDelegate{
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

    @objc func tapMoveAddress(){
        NaverGeocodingManager.shared.getData(address: searchAddress) { address in
            guard let latitude = Double(address.addresses[0].y) else {
                return
            }
            guard let longitude = Double(address.addresses[0].x) else{
                return
            }
            let postion = NMFCameraUpdate(scrollTo: NMGLatLng(lat: latitude , lng: longitude ))
            DispatchQueue.main.async { //
                self.navermapView.mapView.moveCamera(postion)
            }
        }
        addressTextField.text = ""
    }
    @objc func changeTextField(_ sender : UITextField){
        searchAddress = sender.text ?? ""
    }
    @objc func tapRentalButton(){
        print(self.retalPostion)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        self.currentLatitude = location.coordinate.latitude
        self.currentLongtitude = location.coordinate.longitude
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: location.coordinate.latitude, lng: location.coordinate.longitude))
        navermapView.mapView.moveCamera(cameraUpdate)
        
    }
    func getCurrentLoaction(){
        // CLLocationManager클래스의 인스턴스 locationManager를 생성
        locationManager = CLLocationManager()
        locationManager.delegate = self
        // 포그라운드일 때 위치 추적 권한 요청
        locationManager.requestWhenInUseAuthorization()
        // 배터리에 맞게 권장되는 최적의 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 위치 업데이트
        locationManager.startUpdatingLocation()
    }
}
extension HomeVC : UITextFieldDelegate{
}
extension HomeVC : NMFMapViewTouchDelegate{
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        print("\(latlng.lat), \(latlng.lng)")
    }
}

extension HomeVC {
    private func addSubViews(){
        self.view.addSubview(explainLabel)
        self.view.addSubview(addressLabel)
        self.view.addSubview(addressStackView)
        addressStackView.addArrangedSubview(addressTextField)
        addressStackView.addArrangedSubview(addressButton)
        self.view.addSubview(navermapView)
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
        navermapView.snp.makeConstraints { make in
            make.top.equalTo(addressStackView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        rentalButton.snp.makeConstraints { make in
            make.top.equalTo(navermapView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-15)
        }
        addressTextField.setContentHuggingPriority(.init(rawValue: 750), for: .horizontal)
        addressButton.setContentHuggingPriority(.init(rawValue: 751), for: .horizontal)
        addressButton.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
}
