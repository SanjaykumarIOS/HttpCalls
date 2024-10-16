//
//  SignUpView.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 01/04/23.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @State private var errorMessage: String?
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .fontWeight(.bold)
                .background (Color (.systemGray5))
                .cornerRadius (20)
//                .shadow (radius: 10.0, x: 5, y: -3)
                .frame(width: 300)
                .padding(1)
            SecureField("Password", text: $password)
                .padding()
                .fontWeight(.bold)
                .background (Color (.systemGray5))
                .cornerRadius (20)
//                .shadow (radius: 10.0, x: 5, y: -3)
                .frame(width: 300)
                .padding(1)
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .fontWeight(.bold)
                .background (Color (.systemGray5))
                .cornerRadius (20)
//                .shadow (radius: 10.0, x: 5, y: -3)
                .frame(width: 300)
                .padding(1)
            Button(action: signUp) {
                Text("Sign Up")
                    .bold()
                    .foregroundColor(Color.white)
                    .frame(width: 130, height: 50)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .padding()
        VStack {
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
    }
    
    func signUp() {
        if password == confirmPassword {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let error = error {
//                    print("Error signing up: \(error.localizedDescription)")
                    
                    self.errorMessage = ("Error signing up: \(error.localizedDescription)")
                    
                } else {
                    errorMessage = "User signed in successfully."
                }
            }
        } else {
            errorMessage = ("Passwords do not match.")
        }
    }
}

