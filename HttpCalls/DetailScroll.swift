//
//  DetailScroll.swift
//  HttpCalls
//
//  Created by SwiftAnt IT Solutions on 30/01/23.
//

import Foundation
import SwiftUI

struct DetailScroll: View {
    
    @State var show = false
    
    var body: some View {
      
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12){
                ForEach(datas) { i in
                    
                    HStack {
                        ForEach(i.rows) { j in
                            Cards(row:j)
                        }
                    }
                }
            }
        }
    }
}



struct Cards : View {
    
    var row : row
    @State var show = false
    var body: some View{
        
        VStack(spacing: 8) {
                                      
                                      NavigationLink(destination: DetailView(show: $show), isActive: $show)
                                      {
                                          
                                          Image(row.image).renderingMode(.original).resizable().frame(width: UIScreen.main.bounds.width / 2 - 25, height: 240)
                                                                             .cornerRadius(25)
                                      }
                                     
                                      HStack {
                                          
                                          VStack(alignment: .leading,  spacing: 10) {
                                              Text(row.name)
                                              Text(row.price).fontWeight(.heavy)
                                    
                                          }
                                      
                                   Spacer()
                                     
                                          Button(action: {
                                              
                                          }) {
                                              Image("option").renderingMode(.original)
                                          }
                                     
                                          .padding(.trailing, 15)
                                          
            }
        }
    }
}

struct rounded : Shape {
    
    func path(in rect:CGRect) ->Path {
        
        let path  = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}





struct type: Identifiable {
    
    var id  :   Int
    var rows : [row]

}

struct row: Identifiable {
    
    var id:  Int
    var name : String
    var image : String
    var price : String
}


var sizes = ["S","M","L","XL"]
var types = ["Dress","Pantolon","Blazers","Jackets"]
var datas = [
    

    type(id: 0,rows: [row(id:0,name: "Fit And Flare", image: "p21", price: "$199"),row(id:1,name: "Empire Dress", image: "p22", price: "$136")]),

    type(id: 2,rows: [row(id:0,name: "Summer Vibes", image: "p25", price: "$136"),row(id:1,name: "Flora Fun", image: "p27", price: "$150")]),
    
      type(id: 1,rows: [row(id:0,name: "Summer Vibes", image: "p23", price: "$136"),row(id:1,name: "Flora Fun", image: "p24", price: "$150")]),

]
