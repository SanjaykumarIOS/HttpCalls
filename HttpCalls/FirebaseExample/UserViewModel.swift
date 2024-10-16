//
//  UserViewModel.swift
//  HttpCalls
//
//  Created by SwiftAntMac2 on 06/02/23.
//

import Foundation
import FirebaseFirestore
 
class userViewModel: ObservableObject {
    
     
    @Published var users = [UserModel]()
     
    private var db = Firestore.firestore()
     
    func fetchData() {
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
             
            self.users = documents.map { (queryDocumentSnapshot) -> UserModel in
                let data = queryDocumentSnapshot.data()
                //let id = data["id"] as? String ?? ""
                let firstname = data["firstname"] as? String ?? ""
                let lastname = data["lastname"] as? String ?? ""
                let age = data["age"] as? String ?? ""
                let mobileNo = data["mobileNo"] as? String ?? ""
                let place = data["place"] as? String ?? ""
                return UserModel(firstname: firstname, lastname: lastname, age: age, mobileNo: mobileNo, place: place)
            }
        }
    }
}

