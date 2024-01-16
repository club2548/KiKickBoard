//
//  NaverMapView.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/16.
//

import UIKit
import NMapsMap
class NaverMapView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
