






import SwiftUI
import AVFoundation
import Photos


struct VideoRecordingView: View {
    @StateObject private var recorder = Recorder()
    
    @State private var isPaused = false
    
    @State var switchCamera = false
    @State private var isFlashlightOn = false
    @State var scrollText = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                
                CameraPreview(session: $recorder.session)
                    .frame(height: 565) // Adjust the height to your needs
                    .padding(.bottom)
                
                
                
                if recorder.isRecording {
                    
                    Text("\(formatDuration(recorder.recordingDuration))")
                        .font(.system(size: 20))                        .foregroundColor(recorder.isRecording ? Color.white : Color.black)
                        .frame(width: 100, height: 33)
                        .background(recorder.isRecording ? Color.red : Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    
                    
                } else {
                    
                    Text("Tap for recording")
                        .font(.system(size: 20))
                        .foregroundColor(.black.opacity(0.7))
                        .frame(height: 33)
                }
                
                
                HStack {
                    
                    VStack {
                        Button(action: {
                            toggleFlashlight()
                        }) {
                            Image(isFlashlightOn ? "flash-on" : "flash-off")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(7)
                                .background(
                                    Circle()
                                        .foregroundColor(Color.gray.opacity(0.2))
                                        .shadow(radius: 2)
                                )
                                .padding(.leading,20)
                        }
                    }
                    .opacity(switchCamera ? 0 : 1)
                    
                    Spacer()
                    VStack(alignment:.center) {
                        
                        Button(action: {
                            if recorder.isRecording {
                                recorder.stopRecordingWithTimer()
                            } else {
                                recorder.startRecordingWithTimer()
                                
                            }
                        }) {
                            Image(systemName: recorder.isRecording ? "stop.circle" : "record.circle")
                                .padding(3)
                                .foregroundColor(recorder.isRecording ? Color.black :  Color.red)
                                .font(.system(size: 60))
                                .background(
                                    Circle()
                                        .foregroundColor(recorder.isRecording ? Color.gray.opacity(0.3) :  Color.white)
                                        .shadow(color: recorder.isRecording ? .clear : .clear, radius: 2)
                                    
                                )
                            
                        }
                        .padding()
                    }
                    
                    Spacer()
                    VStack {
                        Button(action: {
                            recorder.switchCamera()
                            switchCamera.toggle()
                            
                        }) {
                            Image("switch-camera")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(7)
                                .background(
                                    Circle()
                                        .foregroundColor(Color.gray.opacity(0.2))
                                        .shadow(radius: 2)
                                )
                                .padding(.trailing,20)
                        }
                    }
                    .opacity(recorder.isRecording ? 0 : 1)
                }
                
            }
            
            //  TOOL BAR
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    HStack {
                        
                        Button(action: {
                            
                        })
                        {
                            
                            Image(systemName: "arrow.backward")
                                .bold()
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(.bottom)
                            
                        }
                        
                        Text("Video KYC")
                            .bold()
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding(.bottom)
                            .padding(.leading)
                    }
                }
            }
            .toolbarBackground(Color(red: 250/255.0, green: 77/255.0, blue: 46/255.0), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)

        }
        .overlay {
            
            VStack {
                HStack {
                    Text("Video Kyc Process")
                        .foregroundColor(.white)
                        .frame(width: 600)
                        .offset(x: scrollText ? -300 : 300)
                        .animation(Animation.linear(duration: 7).repeatForever(autoreverses: false))
                        .background(Color.black.opacity(0.6).frame(height: 35))
                        .onAppear {
                            self.scrollText.toggle()
                        }
                }
                .padding(.top,88)
                .frame(height: 35)
                Spacer()
            }
        }
    }
    
    
    // Helper function to format TimeInterval as HH:mm:ss
    private func formatDuration(_ duration: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: duration) ?? "00:00:00"
    }
    
    
    func toggleFlashlight() {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }

        if device.hasTorch {
            do {
                try device.lockForConfiguration()

                if device.torchMode == .on {
                    device.torchMode = .off
                    isFlashlightOn = false
                } else {
                    do {
                        try device.setTorchModeOn(level: 1.0)
                        isFlashlightOn = true
                    } catch {
                        print("Error: \(error)")
                    }
                }
                device.unlockForConfiguration()
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
