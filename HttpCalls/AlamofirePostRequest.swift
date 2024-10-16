//
//  AlamofirePostRequest.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 01/02/23.
//

import Foundation
import SwiftUI
import Alamofire

struct AlamofirePostRequest: View {
    var body: some View {
        
        NavigationStack{
            Spacer()
            Button (action: postMethod) {
                Text("Click")
                    .bold()
                    .frame(width: 250, height: 40)
                    .background(Color.red)
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
        }
    }
}
        func postMethod() {
            let user: Parameters = [
                "firstName": "sanjay",
                "lastName": "kumar",
                "age": 20
            ]
            
            AF.request("https://httpbin.org/post", method: .post, parameters: user, encoding: JSONEncoding.default).responseJSON { response in
                switch response.result {
                case .success(let users):
                    print(users)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
