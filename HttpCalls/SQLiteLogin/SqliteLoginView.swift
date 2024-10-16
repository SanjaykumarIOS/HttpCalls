//
//  SqliteLoginView.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 01/04/23.
//

import Foundation
import SwiftUI


//struct SqliteLoginView: View {
//    @State private var username = ""
//    @State private var password = ""
//    @State private var isAuthenticated = false
//    
//    var body: some View {
//        VStack {
//            TextField("Username", text: $username)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            SecureField("Password", text: $password)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            
//            Button("Login") {
//                do {
//                    if let user = try DataBaseManager().getUser(username: username) {
//                        if user.password == password {
//                            isAuthenticated = true
//                        }
//                    }
//                } catch {
//                    print("Failed to authenticate: \(error.localizedDescription)")
//                }
//            }
//            .padding()
//            
//            if isAuthenticated {
//                Text("Authentication Successful!")
//                    .foregroundColor(.green)
//            } else {
//                Text("Authentication Failed!")
//                    .foregroundColor(.red)
//            }
//        }
//        .padding()
//    }
//}
//struct User {
//    var id: Int64?
//    var username: String
//    var password: String
//}
//
//




struct SqliteLoginView: View {

    // array of user models
    @State var userModels: [UserListModel] = []

    // check if user is selected for edit
    @State var userSelected: Bool = false

    // id of selected user to edit or delete
    @State var selectedUserId: Int64 = 0

    var body: some View {
        // create navigation view
        NavigationView {

            VStack {

                  NavigationLink (destination: EditUserView(id: self.$selectedUserId), isActive: self.$userSelected) {
                    EmptyView()
                }


                List (self.userModels) { (model) in
                    HStack {
                        Text("Username: \(model.username)")
                        Spacer()
                        Text("Password: \(model.password)")
                        Spacer()
                        Button(action: {
                            self.selectedUserId = model.id
                            self.userSelected = true
                        }, label: {
                            Text("Edit")
                                .foregroundColor(Color.blue)
                            })
                            .buttonStyle(PlainButtonStyle())


                        Button(action: {
                            let dbManager: DataBaseManager = DataBaseManager()

                            // call delete function
                            dbManager.deleteUser(idValue: model.id)

                            // refresh the user models array
                            self.userModels = dbManager.getUsers()
                        }, label: {
                            Text("Delete")
                                .foregroundColor(Color.red)
                        })
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                }
                .listStyle(.plain)

                NavigationLink (destination: InsertViewModel(), label: {
                    Text("Home")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 100, height: 30)
                        .background(Color.blue)
                        .cornerRadius(10)
                })

            }.padding()
            .navigationBarTitle("SQLite DB")
            .onAppear(perform: {
                self.userModels = DataBaseManager().getUsers()
            })


        }
    }
}
