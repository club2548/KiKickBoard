//
//  MyPageVC.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/15.
//

import UIKit
import SnapKit
import SwiftUI
struct PreView: PreviewProvider {
  static var previews: some View {
    UINavigationController(rootViewController: MyPageVC()).toPreview()
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


class MyPageVC: UIViewController {
    
    //cell label
    var models: [String] = ["회원정보", "이용내역", "등록한 킥보드", "로그아웃"]

    private let myPageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        
        //셀끼리 간격
        layout.minimumLineSpacing = 1
        
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPageCollectionView.dataSource = self
        myPageCollectionView.delegate = self
        
        myPageAddSubView()
        myPageCollectionViewAutoLayout()
        configureMyPageCollectionView()

    }
    
    func myPageAddSubView() {
        self.view.addSubview(myPageCollectionView)
    }
    
    func myPageCollectionViewAutoLayout() {
        myPageCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func configureMyPageCollectionView() {
        myPageCollectionView.register(MyPageCell.self, forCellWithReuseIdentifier: MyPageCell.MPCidenti)
    }
}

extension MyPageVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //셀 설정 및 반환
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageCell.MPCidenti, for: indexPath) as! MyPageCell
        let model = models[indexPath.item]
        cell.myPageLabel.text = model
        
        cell.backgroundColor = .lightGray

        return cell
    }
    
    //셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    //셀 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let cell = myPageCollectionView.dequeueReusableCell(withReuseIdentifier: MyPageCell.MPCidenti, for: indexPath) as? MyPageCell else { return .zero }
        
        let model = models[indexPath.item]
        cell.myPageLabel.text = model
        //sizeToFit() 글자 사이즈에 맞춤
        cell.myPageLabel.sizeToFit()
        
        let cellheight = cell.myPageLabel.frame.height + 20
        
        return CGSize(width: collectionView.safeAreaLayoutGuide.layoutFrame.width - 30, height: cellheight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0: navigationController?.pushViewController(ProfileVC(), animated:true)
        case 1: navigationController?.pushViewController(HistoryVC(), animated:true)
        case 2: navigationController?.pushViewController(RegisterVC(), animated: true)
        case 3: let alertController = UIAlertController(title: "로그아웃", message: "로그아웃 하시겠습니까?", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Yes", style: .default, handler: nil) // 핸들러로 rootView로 이동
            let cancel = UIAlertAction(title: "No", style: .cancel)
            
            alertController.addAction(cancel)
            alertController.addAction(ok)
            
            present(alertController, animated: true, completion: nil)
        default: break
        }
        
        //로그아웃 alert

        }
        
        
    }
    

