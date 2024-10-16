//
//  AppOpen.swift
//  HttpCalls
//
//  Created by SANJAY  on 09/09/24.
//

import SwiftUI

struct AppOpen: View {
    var body: some View {
        VStack {
            Button(action: openWhatsApp) {
                Text("Open WhatsApp App")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Button(action: openInstagram) {
                Text("Open Instagram App")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }

    func openWhatsApp() {
        let urlScheme = "whatsapp://"

        if let url = URL(string: urlScheme) {
            // Check if WhatsApp is installed and can open the URL
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("WhatsApp is not installed on this device.")
            }
        }
    }
    
    func openInstagram() {
        let urlScheme = "instagram://"

        if let url = URL(string: urlScheme) {
            // Check if Instagram is installed and can open the URL
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("Instagram is not installed on this device.")
            }
        }
    }
}
