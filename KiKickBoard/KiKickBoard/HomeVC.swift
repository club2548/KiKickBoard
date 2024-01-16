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
    private lazy var mapView : KMViewContainer = {
        let view = KMViewContainer()
        return view
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title = "Home"
        
        
        
    }
  
 
}
extension HomeVC {
    private func addSubViews(){
        self.view.addSubview(explainLabel)
        self.view.addSubview(mapView)
        
    }
    private func setAutoLayout(){
        explainLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        mapView.snp.makeConstraints { make in
            make.top.equalTo(explainLabel.snp.bottom).offset(15)
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



