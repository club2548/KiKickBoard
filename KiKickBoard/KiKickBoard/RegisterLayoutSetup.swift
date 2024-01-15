import UIKit
import SnapKit


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


// MARK: -Pre View
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
