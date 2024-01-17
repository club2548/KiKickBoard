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
import Foundation
class HomeVC: UIViewController{
    var locationManager: CLLocationManager! // 현재위치 정보를 받아오기 위함
    var currentLatitude: Double = 0 // 현재 위치 lat 저장
    var currentLongtitude: Double = 0 // 현재위지 lng 저장
    var searchAddress = "" // 검색한 주소 저장
    var markers : [NMFMarker] = BaseKickBoardData().baseKickBoard // 지도의 Mark qoduf
    
    private lazy var explainLabel : UILabel = { // 상위 설명 Label
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "설명 글"
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    private lazy var addressLabel : UILabel = { // 주소 입력 Label
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "주소 입력"
        label.textAlignment = .left
        return label
    }()
    private lazy var addressStackView : UIStackView = { // 주소 입력 TextField와 주소 이동 Button 을 묶는 StackView
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    private lazy var addressTextField : UITextField = { // 주소입력 TextField
        let textField = UITextField()
        textField.placeholder = "주소를 입력하세요."
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.addTarget(self, action: #selector(changeTextField(_:)), for: .editingChanged)
        return textField
    }()
    private lazy var addressButton : UIButton = { // 입력된 주소로 이동 Button
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let button = UIButton(configuration: config)
        button.setTitle("이동", for: .normal)
        button.backgroundColor = UIColor(named: "PrimaryColor")
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapMoveAddress), for: .touchUpInside)
        return button
    }()
    private lazy var usingLabel : UILabel = { // 킥보드 사용중일 경우 표시되는 Label
        let label = UILabel()
        label.isHidden = true
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor(named: "PrimaryColor")
        label.text = "이용 중"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    private lazy var navermapView : NMFNaverMapView = { // 네이버 지도 View
        let mapView = NMFNaverMapView() // 지도 객체 생성
        mapView.showLocationButton = true
        return mapView
    }()
    private lazy var returnButton : UIButton = { // 킥보드 반납하기 Button
        let button = UIButton()
        button.setTitle("반납하기", for: .normal)
        button.isEnabled = false
        button.backgroundColor = UIColor.gray
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapReturnButton), for: .touchUpInside)
        button.isHidden = true
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
        navermapView.mapView.touchDelegate = self
        setMapKickBoardMark()
    }
    
}
extension HomeVC : CLLocationManagerDelegate{
    //MARK: - 좌표 및 지도 관련
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { // 현재 사용자 위치 받아오기
        let location = locations[locations.count - 1]
        self.currentLatitude = location.coordinate.latitude // 현재 사용자 좌표 lat
        self.currentLongtitude = location.coordinate.longitude // 현재 사용자 좌표 lng
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: location.coordinate.latitude, lng: location.coordinate.longitude)) // 카메라 이동될 좌표
        navermapView.mapView.moveCamera(cameraUpdate) // 현재 사용자 위치 기준으로  카메라 이동
    }
    func getCurrentLoaction(){
        locationManager = CLLocationManager()// CLLocationManager클래스의 인스턴스 locationManager를 생성
        locationManager.delegate = self// 포그라운드일 때 위치 추적 권한 요청
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest// 배터리에 맞게 권장되는 최적의 정확도
        locationManager.startUpdatingLocation()// 위치 업데이트
    }
    //MARK: - Button Action
    @objc func tapMoveAddress(){ // 입력된 주소로 이동 함수
        NaverGeocodingManager.shared.getData(address: searchAddress) { address in
            guard let latitude = Double(address.addresses[0].y) else {
                return
            }
            guard let longitude = Double(address.addresses[0].x) else{
                return
            }
            let postion = NMFCameraUpdate(scrollTo: NMGLatLng(lat: latitude , lng: longitude ))
            DispatchQueue.main.async { // UI업데이트는 Main 스레드에서 이루어져야함 (설정안해줘서 오류발생)
                self.navermapView.mapView.moveCamera(postion)
            }
        }
        addressTextField.text = ""
    }
    @objc func changeTextField(_ sender : UITextField){
        searchAddress = sender.text ?? "" // 주소 입력창에 입력되는 Text
    }
    @objc func tapReturnButton(){// 키보드 반납하기 버튼 Action
        self.changeUsingStatus(use: false) // 키보드 반납
        let returnKickBoard = NMFMarker(position: NMGLatLng(lat: self.currentLatitude, lng: self.currentLongtitude), iconImage: NMFOverlayImage(name: "KickBoardImg"))
        self.markers.append(returnKickBoard) // 킥보드 마커 배열 추가
        setMapKickBoardMark() // 킥보드 마커 업데이트
        
        
    }
// MARK: - 킥보드 마커 설정
    func setMapKickBoardMark(){
        for (idx,mark) in markers.enumerated(){
            mark.anchor = CGPoint(x: 0.5, y: 0.5) // 마커의 중심읠 현재위치로 설정
            mark.mapView = self.navermapView.mapView
            
            mark.touchHandler = { (overlay : NMFOverlay) -> Bool in // marker의 touch Event
                let currentCoordinate = CLLocation(latitude: self.currentLatitude, longitude: self.currentLongtitude) // 현재 위치 좌표
                let from = CLLocation(latitude: mark.position.lat, longitude: mark.position.lng) // mark 위치 좌표
                let dist = currentCoordinate.distance(from: from) // 현재 위치에서 킥보드사이의 거리 (미터 기준)
                if dist <= 100 { // 100m 이하일 경우
                    let alert = UIAlertController(title: "대여하기", message: "해당 킥보드를 대여하시겠습니까?", preferredStyle: .alert)
                    let confirmAction = UIAlertAction(title: "대여", style: .default){ _ in
                        self.changeUsingStatus(use: true)
                        self.markers.remove(at: idx)
                        mark.mapView = nil // 대여 함으로써 해당 킥보드 마커 지우기
                    }
                    let cancelAction = UIAlertAction(title: "취소", style: .cancel)
                    alert.addAction(confirmAction)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true)
                }else{
                    let alert = UIAlertController(title: "킥보드와의 거리가 100m이상입니다.", message: "킥보드에 가까이 와주세요. ", preferredStyle: .alert)
                    let confirmAction = UIAlertAction(title: "확인", style: .cancel)
                    alert.addAction(confirmAction)
                    self.present(alert, animated: true)
                }
                return true
            }
            
        }
    }
    
}
extension HomeVC : NMFMapViewTouchDelegate{ // 맵 클릭해서 좌표 알아내기 위함
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        print("\(latlng.lat), \(latlng.lng)")
    }
}

extension HomeVC {
    private func setExplainLabel(){ // explainLabel 설정
        let text = "가까운 곳의 킥보드를 찾아보세요.\n대여를 원하는 킥보드를 클릭하세요."
        var attributeString = NSMutableAttributedString(string: text)
        explainLabel.setRangeFontColor(fullText : text ,range: "대여를 원하는 킥보드를 클릭하세요.", color: .gray, fontSzie: 15,attributeString: &attributeString)
        explainLabel.setLineSpacing(attributeString: &attributeString, spacing: 10)
        
    }
    private func addSubViews(){
        self.view.addSubview(explainLabel)
        self.view.addSubview(addressLabel)
        self.view.addSubview(addressStackView)
        addressStackView.addArrangedSubview(addressTextField)
        addressStackView.addArrangedSubview(addressButton)
        self.view.addSubview(navermapView)
        self.view.addSubview(returnButton)
        navermapView.addSubview(usingLabel)
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
        returnButton.snp.makeConstraints { make in
            make.top.equalTo(navermapView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-15)
        }
        usingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
        }
        addressTextField.setContentHuggingPriority(.init(rawValue: 750), for: .horizontal)
        addressButton.setContentHuggingPriority(.init(rawValue: 751), for: .horizontal)
        addressButton.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    private func changeUsingStatus(use : Bool){ // 킥보드 이용중 상태에 따라  이용 중 라벨, 반납하기 UI 상태 변경
        if use {
            self.usingLabel.isHidden = false
            self.returnButton.isHidden = false
            self.returnButton.isEnabled = true
            self.returnButton.backgroundColor = UIColor(named: "PrimaryColor")
            
        }else{
            self.returnButton.isHidden = true
            self.usingLabel.isHidden = true
            self.returnButton.isEnabled = false
            self.returnButton.backgroundColor = UIColor.gray
        }
    }
}
