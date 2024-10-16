//
//  FirstView.swift
//  HttpCalls
//
//  Created by SANJAY  on 20/02/24.
//

import SwiftUI

import SwiftUI

//struct Message: Identifiable {
//    var id = UUID()
//    var sender: String
//    var content: String
//    var timestamp: Date
//}
//
//class ChatViewModel: ObservableObject {
//    @Published var messages: [Message] = []
//
//    func addMessage(_ message: Message) {
//        messages.append(message)
//    }
//}
//
//struct ChatView: View {
//    @ObservedObject var viewModel: ChatViewModel
//    @State private var newMessage = ""
//
//    var body: some View {
//        VStack {
//            ScrollView {
//                ForEach(viewModel.messages) { message in
//                    MessageView(message: message)
//                }
//            }
//            .padding()
//
//            HStack {
//                TextField("Type your message...", text: $newMessage)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//
//                Button("Send") {
//                    sendMessage()
//                }
//                .padding()
//            }
//        }
//        .navigationBarTitle("Chat App")
//    }
//
//    func sendMessage() {
//        guard !newMessage.isEmpty else { return }
//
//        let message = Message(sender: "User", content: newMessage, timestamp: Date())
//        viewModel.addMessage(message)
//
//        // Simulate a response from the bot
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            let botResponse = Message(sender: "Bot", content: "I received your message: \(newMessage)", timestamp: Date())
//            viewModel.addMessage(botResponse)
//        }
//
//        newMessage = ""
//    }
//}
//
//struct MessageView: View {
//    var message: Message
//    
//    var dateFormatter: DateFormatter {
//           let formatter = DateFormatter()
//           formatter.dateStyle = .medium
//           formatter.timeStyle = .short
//           return formatter
//       }
//
//    var body: some View {
//        HStack {
//            if message.sender == "User" {
//                Spacer()
//            }
//
//            VStack(alignment: .leading) {
//                Text(message.content)
//                    .padding(10)
//                    .background(message.sender == "User" ? Color.blue : Color.gray)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//
//                Text("\(message.timestamp, formatter: dateFormatter)")
//                    .font(.footnote)
//                    .foregroundColor(.gray)
//            }
//
//            if message.sender == "Bot" {
//                Spacer()
//            }
//        }
//        .padding(.horizontal)
//    }
//}
//
//struct FirstView: View {
//    @StateObject var chatViewModel = ChatViewModel()
//
//    var body: some View {
//        NavigationView {
//            ChatView(viewModel: chatViewModel)
//        }
//    }
//}



//#Preview {
//    FirstView()
//}






import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isSentByUser: Bool
}

struct ChatView: View {
    @State private var newMessage = ""
    @State private var messages: [Message] = [
        Message(text: "Hello!", isSentByUser: false),
        Message(text: "Hi there!", isSentByUser: true),
        // Add more messages as needed
    ]

    var body: some View {
        VStack {
            List(messages) { message in
                MessageRow(message: message)
            }
            
            HStack {
                TextField("Type a message", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 0))

                Button("Send") {
                    sendMessage()
                }
                .padding(8)
            }
            .padding()
        }
        .navigationTitle("Chat")
    }

    func sendMessage() {
        guard !newMessage.isEmpty else { return }
        messages.append(Message(text: newMessage, isSentByUser: true))
        newMessage = ""
    }
}

struct MessageRow: View {
    let message: Message

    var body: some View {
        HStack {
            if message.isSentByUser {
                Spacer()
            }

            Text(message.text)
                .padding(10)
                .background(message.isSentByUser ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)

            if !message.isSentByUser {
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView()
        }
    }
}
