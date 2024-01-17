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
    
    private let myPageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        
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
        cell.backgroundColor = .lightGray
        cell.profileLabel.text
        return cell
    }
    
    //셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    //셀 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 100)
    }
    
    //셀끼리 간격. 근데 왜 안 먹냐...?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        
        return 0
    }


    }

