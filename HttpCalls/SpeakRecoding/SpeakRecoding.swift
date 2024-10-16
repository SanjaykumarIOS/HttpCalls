//
//  SpeakRecoding.swift
//  HttpCalls
//
//  Created by SANJAY  on 01/03/24.
//


import Foundation
import Speech
import AVFoundation

class SpeechRecognitionManager: ObservableObject {
    @Published var recognizedText: String = ""
    @Published var isRecording: Bool = false
    @Published var currentLanguage: String = "ta-IN" {
        didSet {
            stopRecording()
            startRecording()
        }
    }

    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ta-IN"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()

    func toggleRecording() {
        isRecording.toggle()
        isRecording ? startRecording() : stopRecording()
    }

    private func startRecording() {
        guard recognitionTask == nil else { return }

        let request = SFSpeechRecognitionRequest()
        request.shouldReportPartialResults = true

        recognitionTask = speechRecognizer?.recognitionTask(with: request) { result, error in
            if let result = result {
                self.recognizedText = result.bestTranscription.formattedString

                if result.isFinal {
                    // Do something with the final recognized text
                    print("Final Recognized Text: \(self.recognizedText)")
                }
            } else if let error = error {
                print("Recognition task error: \(error)")
            }
        }

        try? audioEngine.start()

        recognitionRequest?.endAudio()
    }

    private func stopRecording() {
        audioEngine.stop()
        // Remove tap only if it exists
        let inputNode = audioEngine.inputNode
        inputNode.removeTap(onBus: 0)
        
        recognitionRequest?.endAudio()
        recognitionRequest = nil
        recognitionTask?.cancel()
        recognitionTask = nil
    }
}




import SwiftUI
import Speech



import SwiftUI

struct SpeakRecoding: View {
    @StateObject var speechRecognitionManager = SpeechRecognitionManager()

    var body: some View {
        VStack {
            Text(speechRecognitionManager.recognizedText)
                .padding()

            Button(action: {
                speechRecognitionManager.toggleRecording()
            }) {
                Text(speechRecognitionManager.isRecording ? "Stop Recording" : "Start Recording")
            }

            Button("Switch Language") {
                speechRecognitionManager.currentLanguage = "es-ES" // Change to the desired language identifier
            }
        }
        .environmentObject(speechRecognitionManager)
    }
}





#Preview {
    SpeakRecoding()
}
