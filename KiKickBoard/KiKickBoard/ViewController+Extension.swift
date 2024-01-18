//
//  ViewController+Extension.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/18.
//

import Foundation
import UIKit
extension UIViewController {
    func ketBoardHide(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    @objc func dismissKeyBoard(){
        view.endEditing(true)
    }
}
