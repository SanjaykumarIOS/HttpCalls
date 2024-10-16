//
//  Post.swift
//  HttpCalls
//
//  Created by SwiftAnt IT Solutions on 28/01/23.
//

import Foundation
import SwiftUI
//
//struct Post: Codable{
//    let userId: Int
//    let id: Int
//    let title: String
//    let body: String
//    
//}
//
//func callAPI()
//{
//    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else{
//        return
//    }
//    let task = URLSession.shared.dataTask(with: url){
//        data, response, error in
//        
//        if let data = data, let string = String(data: data, encoding: .utf8){
//            print(string)
//        }
//    }
//
//    task.resume()
//}
//callAPI()
//
//func decodeAPI(){
//    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{return}
//
//    let task = URLSession.shared.dataTask(with: url){
//        data, response, error in
//        
//        let decoder = JSONDecoder()
//
//        if let data = data{
//            do{
//                let tasks = try decoder.decode([Post].self, from: data)
//                tasks.forEach{ i in
//                    print(i.title)
//                }
//            }catch{
//                print(error)
//            }
//        }
//    }
//    task.resume()
//}
//decodeAPI()
