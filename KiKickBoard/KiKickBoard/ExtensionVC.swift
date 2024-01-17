//
//  ExtensionVC.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/16.
//

import Foundation
import UIKit
extension UIView{
    func addSubViews(_ views : [UIView]){
        _ = views.map{self.addSubview($0)}
    }
}
