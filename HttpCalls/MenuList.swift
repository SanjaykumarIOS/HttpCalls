//
//  MenuList.swift
//  HttpCalls
//
//  Created by SwiftAnt IT Solutions on 30/01/23.
//

import Foundation
import SwiftUI

struct MenuList: View {
    var body: some View {
        
        NavigationView{
         
            VStack(spacing: 15){
                
                ZStack{
                    
                    Text("Seasons").font(.title)
                    
                    HStack(spacing: 18){
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("menu1").renderingMode(.original)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("search1").renderingMode(.original)
                        }
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("noti1").renderingMode(.original)
                        }
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("shop1").renderingMode(.original)
                        }

                    }
                }.background(Color.white)
                .padding([.leading,.trailing,.top], 15)
                
                MainView()
            }.navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
