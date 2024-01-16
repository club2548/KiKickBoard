//
//  NaverGeocodingManager.swift
//  KiKickBoard
//
//  Created by 원동진 on 2024/01/16.
//

import Foundation

class NaverGeocodingManager {
    static let shared = NaverGeocodingManager()
    func getData(address : String, completion : @escaping(NMapAddModel) -> Void){
        guard let baseURL = URL(string: "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode") else{
            print("Error: URL ")
            return
        }
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        components?.queryItems = [URLQueryItem(name: "query", value: address)]
        var request = URLRequest(url: (components?.url)!)
        request.httpMethod = "GET"
        request.setValue("2xkmerjbz5", forHTTPHeaderField: "X-NCP-APIGW-API-KEY-ID")
        request.setValue("VgFQzLLwe57aS2SdVUzLG2imCIp2azEsfHZEu1hF", forHTTPHeaderField: "X-NCP-APIGW-API-KEY")
        URLSession(configuration: .default).dataTask(with: request) { data, response, error in
            guard error == nil else{
                print("Error : \(String(describing: error?.localizedDescription))")
                return
            }
            guard let data = data else {
                return
            }
            do{
                let mapData : NMapAddModel = try JSONDecoder().decode(NMapAddModel.self, from: data)
                completion(mapData)
            }catch{
                print("Decoding Error : \(String(describing: error.localizedDescription))")
            }
            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode)else {
                return
            }
            print("HTTP Status Code: \(httpResponse.statusCode)")
        }.resume()
    }
}
