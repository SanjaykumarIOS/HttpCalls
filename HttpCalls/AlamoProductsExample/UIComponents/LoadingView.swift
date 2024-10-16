//
//  LoadingView.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 04/02/23.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    var body: some View {
        HStack {
            Label("Loading", systemImage: "clock")
                .foregroundColor(.white)
        }.frame(maxWidth: .infinity, maxHeight: 100)
            .background(.teal)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            
    }
}
