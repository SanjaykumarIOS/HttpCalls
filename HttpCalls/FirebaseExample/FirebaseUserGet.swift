//
//  FirebaseUserGet.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 06/02/23.


import Foundation
import SwiftUI

struct FirebaseUserGet: View {
    
    @ObservedObject private var viewModel = userViewModel()
    
    var body: some View {
            
            NavigationView {
                
                List(viewModel.users) { user in
                    VStack(alignment: .leading) {
                        
                        Text("FirstName: \(user.firstname)")
                            .fontDesign(.serif)
                            .padding(1)
                            .font(.system(size: 20))
                            
                        Text("LastName: \(user.lastname)")
                            .fontDesign(.serif)
                            .padding(1)
                            .font(.system(size: 20))
                            
                        Text("Age: \(user.age)")
                            .fontDesign(.serif)
                            .padding(1)
                            .font(.system(size: 20))
                            
                        Text("MobileNo: \(user.mobileNo)")
                            .fontDesign(.serif)
                            .padding(1)
                            .font(.system(size: 20))
                            
                        Text("Place: \(user.place)")
                            .fontDesign(.serif)
                            .padding(1)
                            .font(.system(size: 20))
                            
                    }
                }.navigationBarTitle("Users")
                    .onAppear() {
                        self.viewModel.fetchData()
            }
        }
    }
}

