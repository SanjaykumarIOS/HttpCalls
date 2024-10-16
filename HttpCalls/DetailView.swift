//
//  DetailView.swift
//  HttpCalls
//
//  Created by SwiftAnt IT Solutions on 30/01/23.
//

import Foundation
import SwiftUI

struct DetailView : View {
    
@Binding var show : Bool
@State var size = ""

var body : some View{
    
    VStack(spacing : 0){
        
        HStack(spacing: 18){
            
            Button(action: {
                
                self.show.toggle()
                
            }) {
                
                Image("back").renderingMode(.original)
            }
            
            Spacer()
            
            Button(action: {
                
            }) {
                
                Image("search1").renderingMode(.original)
            }
            
            Button(action: {
                
            }) {
                
                Image("shop1").renderingMode(.original)
            }

        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .background(Color.white)
        .padding([.leading,.trailing,.top], 15)
        
        
//        resime tıkladıgında gelecek yer
      
      
            
        
        Image("p21").resizable().frame(width: 280, height: 400, alignment:.center )
            .cornerRadius(25)
    
        
        VStack(spacing: 15) {
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                               Text("Summer Vibes").font(.largeTitle)
                                         Text("199").fontWeight(.heavy)
                                       
                           }
                Spacer()
                HStack(spacing:10) {
                    Circle().fill(Color.red).frame(width: 20, height: 20)
                      Circle().fill(Color.yellow).frame(width: 20, height: 20)
                      Circle().fill(Color.green).frame(width: 20, height: 20)
                      Circle().fill(Color.blue).frame(width: 20, height: 20)
                    
                    
                }
            
           
            }
           
           
            Text("Bu sezonun erkek ceketleri bir çok tarza uygun. Klasik deri ve içi yün ceketlerin modası asla geçmiyor.") .font(.footnote)
           
            Text("Beden")
            HStack {
                ForEach(sizes, id:\.self){ i in
            
                Button(action: {
                    self.size = i
                }) {
                    Text(i).padding().border(Color.black, width: self.size == i ? 1.5 : 0)
                }.foregroundColor(.black)
             }
        }
            
            
            Spacer()
        .padding()
            }}}}
