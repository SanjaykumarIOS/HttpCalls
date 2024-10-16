//
//  HttpCallsApp.swift
//  HttpCalls
//
//  Created by SwiftAnt IT Solutions on 28/01/23.
//

import SwiftUI
import Firebase

@main
struct HttpCallsApp: App {
    
    init() {
       FirebaseApp.configure()
       }
    
    @StateObject var cart = Cart()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cart)
        }
    }
}
