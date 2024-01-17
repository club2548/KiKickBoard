import Foundation
import NMapsMap


class KickBoardInfo {
    var serialNumber: Int
    var baseRate: String
    var extraFee: String
    var position: NMGLatLng
    var iconImage: NMFOverlayImage
    
    init(serialNumber: Int, baseRate: String, extraFee: String, position: NMGLatLng) {
        self.serialNumber = serialNumber
        self.baseRate = baseRate
        self.extraFee = extraFee
        self.position = position
        self.iconImage = NMFOverlayImage(name: "KickBoradImg")
    }
}

class KickBoardData {
    static let shared = KickBoardData()
    
    var kickboards: [KickBoardInfo] = []
    
    private init() {}
}

//struct BaseKickBoardData {
//    var baseKickBoard: [NMFMarker] {
//        return KickBoardData.shared.kickboards.map { kickboardInfo in
//            let marker = NMFMarker(position: kickboardInfo.position)
//            marker.iconImage = kickboardInfo.iconImage
//            return marker
//        }
//    }
//}

