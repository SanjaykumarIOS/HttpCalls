//
//  ApiServiceManager.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 02/02/23.
//

//import Foundation
//import SwiftUI
//
//class ServiceManager {
//    public static let shared = ServiceManager ()
//
//    func callService<T: Decodable>(urlString: String, success: @escaping ((T) ->
//        Void), fail: @escaping (() -> Void) ){
//
//        let url = URL(string: urlString)
//        guard let urlobi = url else { return }
//
//        let session = URLSession.shared
//        var request = URLRequest(url: urlobi)
//
//        request.httpMethod = "GET"
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest,
//            completionHandler: {data, response, error in
//
//            guard error == nil else { return }
//            guard let data = data else {return}
//
//            let decoder = JSONDecoder()
//            if let json = try? decoder.decode(T.self, from: data){
//                success(json)
//            }else {
//                fail()
//            }
//
//            print (data)
//        })
//        task.resume()
//    }
//}
