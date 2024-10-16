//
//  MainView.swift
//  HttpCalls
//
//  Created by SwiftAnt IT Solutions on 30/01/23.
//

import Foundation
import SwiftUI

struct MainView: View {
    var body: some View {
     
        VStack (spacing: 15) {
            HStack {
                HStack {
                    Button(action: {
                        
                    }) {
                        Text("Causel Dress")
                        Spacer()
                        Image("down").renderingMode(.original)
                    }.padding()
                .foregroundColor(.black)
                .background(Color.white)
                Button(action: {
                    
                }) {
                    Image("filter").renderingMode(.original).padding()
                    
                }.background(Color.white)
            
                }
                 
            }
            DetailScroll()
            
        }.background(Color("color"))
        .padding()
       
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
