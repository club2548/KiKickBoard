//
//  KeyboardControll.swift
//  KiKickBoard
//
//  Created by t2023-m0026 on 1/18/24.
//

import UIKit

extension SignUpVC {
    func setUpKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        view.frame.origin.y -= 300
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        view.frame.origin.y = 0
    }
}
