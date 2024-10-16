//
//  EditUserView.swift
//  SQLiteLogin
//
//  Created by SwiftAntMac2 on 08/02/23.
//

import Foundation
import SwiftUI

struct EditUserView: View {

    // id receiving of user from previous view
    @Binding var id: Int64
     
    // variables to store value from input fields
    @State var username: String = ""
    @State var password: String = ""
    
     
    // to go back to previous view
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        VStack {
            // create username field
            TextField("Enter UserName", text: $username)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .disableAutocorrection(true)
             
            // create password field
            TextField("Enter Password", text: $password)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .autocapitalization(.none)
                .disableAutocorrection(true)
             
           
             
            // button to update user
            Button(action: {
                // call function to update row in sqlite database
                DataBaseManager().updateUser(idValue: self.id, usernameValue: self.username, passwordValue: self.password)
 
                // go back to home page
                self.mode.wrappedValue.dismiss()
            }, label: {
                Text("Update")
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
 
        // populate user's data in fields when view loaded
        .onAppear(perform: {
             
            // get data from database
            let userModel: UserListModel = DataBaseManager().getUser(idValue: self.id)
             
            // populate in text fields
            self.username = userModel.username
            self.password = userModel.password
            
        })
    }
}

struct EditUserView_Previews: PreviewProvider {

    // when using @Binding, do this in preview provider
    @State static var id: Int64 = 0

    static var previews: some View {
        EditUserView(id: $id)
    }
}
