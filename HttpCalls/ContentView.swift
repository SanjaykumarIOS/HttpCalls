//
//  ContentView.swift
//  HttpCalls
//
//  Created by SwiftAnt IT Solutions on 28/01/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
   
    var body: some View {
        
//        NetworkConnection()
        
        NavigationStack{
            
            List{
                
                NavigationLink(("Pokemon"), destination: PokemonList())
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                
                NavigationLink("Jokes", destination: FetchApiJoke())
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                
                NavigationLink("AlamofireGet", destination: AlamofireGetRequest())
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                
                NavigationLink("AlamofirePost", destination: AlamofirePostRequest())
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                
                NavigationLink("AlamoProductsGet", destination: AlamofireProductGetRequest())
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                
                NavigationLink("FirebaseGet", destination: FirebaseUserGet())
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                
                NavigationLink("FirebaseLogin", destination: AuthView())
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                
                NavigationLink("SqliteLogin", destination: SqliteLoginView())
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                
                NavigationLink("Chat App", destination: ChatView())
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                
                NavigationLink("Video Record", destination: VideoRecordingView())
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                
                NavigationLink("Apps Open", destination: AppOpen())
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                
//                NavigationLink("Speak Record", destination: SpeakRecoding())
//                    .bold()
//                    .font(.system(size: 30))
//                    .padding()
               
            }
        }
        .preferredColorScheme(.light)
    }
}


struct NetworkConnection: View {
    
    @ObservedObject var monitor = NetworkMonitor()
    @State private var showAlertSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: monitor.isConnected ? "wifi" : "wifi.slash")
                    .font(.system(size: 56))
                Text(monitor.isConnected ? "Connected!" : "Not connected!")
                    .padding()
                Button("Perform Network Request") {
                    self.showAlertSheet = true
                }
            }
                
            .alert(isPresented: $showAlertSheet, content: {
                if monitor.isConnected {
                    return Alert(title: Text("Success!"), message: Text("The network request can be performed"), dismissButton: .default(Text("OK")))
                }
                return Alert(title: Text("No Internet Connection"), message: Text("Please enable Wifi or Celluar data"), dismissButton: .default(Text("Cancel")))
            })
        }
    }
}






import Foundation
import Network
 
final class NetworkMonitor: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
     
    @Published var isConnected = true
     
    init() {
        monitor.pathUpdateHandler =  { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied ? true : false
            }
        }
        monitor.start(queue: queue)
    }
}








//                NavigationLink("Products", destination: ProductList())
//                    .bold()
//                    .font(.system(size: 30))
//                    .padding()
                
                //FetchData()
