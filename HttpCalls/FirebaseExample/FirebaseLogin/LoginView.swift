//
//  LoginView.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 01/04/23.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Email", text: $email)
                    .padding()
                    .keyboardType(.emailAddress)
                    .fontWeight(.bold)
                    .background (Color (.systemGray5))
                    .cornerRadius (20)
                    .frame(width: 300)
                    .padding(1)
                
                SecureField("Password", text: $password)
                    .padding()
                    .fontWeight(.bold)
                    .background (Color (.systemGray5))
                    .cornerRadius (20)
                    .frame(width: 300)
                    .padding(1)
                
                Button(action: {
                    signIn()
                })
                {
                    Text("Sign In")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 130, height: 50)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding()
                }
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
            }
            .padding()
           
           
        }
        .navigationTitle("FIREBASE LOGIN")
    }
    
    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
//                print("Error signing in: \(error.localizedDescription)")
                
                self.errorMessage = error.localizedDescription
            } else {
              errorMessage = "User signed in successfully."
            }
        }
    }
}
