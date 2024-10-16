//
//  AuthView.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 01/04/23.
//

import Foundation
import SwiftUI

struct AuthView: View {
    @State var showSignIn = true
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    if showSignIn {
                        LoginView()
                    } else {
                        SignUpView()
                    }
                    
                    Button(action: { showSignIn.toggle() }) {
                        if showSignIn {
                            Text("Don't have an account? Sign up")
                        } else {
                            Text("Already have an account? Sign in")
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Center vertically and horizontally
                .padding() // Optional padding for spacing
                .background(Color.clear)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Center inside the ScrollView
            .background(Color.clear)
        }
    }
}
