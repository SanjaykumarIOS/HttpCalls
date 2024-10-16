//
//  InsertViewModel.swift
//  SQLiteLogin
//
//  Created by SwiftAntMac2 on 08/02/23.
//

import Foundation
import SwiftUI

struct InsertViewModel: View {

    //create variables to store user input values
    @State var userName: String = ""
    @State var passWord: String = ""
    
    @State var user: [UserListModel] = []
    
    @State private var isCountAlert: Bool = false
    
    @State private var isAuthenticated = false

    // to go back on the home screen when the user is added
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        
        NavigationView{
            
            VStack {
                
                // create username field
                TextField("Enter UserName", text: $userName)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                    .disableAutocorrection(true)
                    .padding(5)

                // create password field
                SecureField("Enter Password", text: $passWord)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(5)

                NavigationLink(destination: WelcomeView()) {
                    Button(action: {
                        login()
                        
                        DataBaseManager().fetchUser(usernameValue: userName, passwordValue: passWord)

                        // go back to home page
                        self.mode.wrappedValue.dismiss()

                    }, label: {
                        
                        Text("Log in")
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 40)
                            .background(Color.blue)
                            .cornerRadius(10)
                    })
                }
                Button(action: {
                    
                    // call function to add row in sqlite database
                    DataBaseManager().addUser(usernameValue: self.userName, passwordValue: self.passWord)

                    // go back to home page
                    self.mode.wrappedValue.dismiss()

                }, label: {

                    Text("Add User")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 40)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 10)
                .padding(.bottom, 10)
            }.padding()
                .navigationBarTitle("HomePage")
            
            // Alert message
                .alert(isPresented: $isCountAlert) {
                    Alert(title: Text("Enter the password in 6 Character"))
                }
        }
    }
    
  // Create func for password count check
    func login() {
          if passWord.count < 6 {
           isCountAlert = true
             return
        }
    }
}


struct WelcomeView: View {
    var body: some View {
        Text("WelCome User")
    }
}

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
       InsertViewModel()
    }
}


