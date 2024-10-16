


import SwiftUI
import AVFoundation
import Photos

class Recorder: NSObject, AVCaptureFileOutputRecordingDelegate, ObservableObject {
    
    @Published var session = AVCaptureSession()
    @Published var isRecording = false
    private let movieOutput = AVCaptureMovieFileOutput()
    private var currentCamera: AVCaptureDevice.Position = .back
    private var videoInput: AVCaptureDeviceInput?
    
    private var videoOutputURL: URL?
    
    @Published var recordingDuration: TimeInterval = 0
    private var timer: Timer?
    private var startDate: Date?
    
    
    override init() {
        super.init()
        addAudioInput()
        addVideoInput()
        if session.canAddOutput(movieOutput) {
            session.addOutput(movieOutput)
        }
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.session.startRunning()
        }
    }
    
    func startRecordingWithTimer() {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("video.mp4") else { return }
        
        if !isRecording {
            if FileManager.default.fileExists(atPath: url.path) {
                try? FileManager.default.removeItem(at: url)
            }
            
            videoOutputURL = url
            movieOutput.startRecording(to: url, recordingDelegate: self)
            isRecording = true
            
            recordingDuration = 0
            startDate = Date()
            startTimer()
        }
    }
    
    func stopRecordingWithTimer() {
        if isRecording {
            isRecording = false
            movieOutput.stopRecording()
            timer?.invalidate()
            recordingDuration = 0
        }
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.recordingDuration += 1
        }
    }
    
    
    private func addAudioInput() {
        guard let device = AVCaptureDevice.default(for: .audio) else { return }
        guard let input = try? AVCaptureDeviceInput(device: device) else { return }
        if session.canAddInput(input) {
            session.addInput(input)
        }
    }
    
    private func addVideoInput() {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: device) else { return }
        if session.canAddInput(input) {
            session.addInput(input)
        }
    }
    
    
    func switchCamera() {
        session.beginConfiguration()
        // Remove existing inputs
        session.inputs.forEach { input in
            session.removeInput(input)
        }
        
        // Toggle between front and back camera
        if currentCamera == .front {
            guard let backCamera = AVCaptureDevice.default(for: .video) else { return }
            guard let input = try? AVCaptureDeviceInput(device: backCamera) else { return }
            if session.canAddInput(input) {
                session.addInput(input)
            }
            currentCamera = .back
           
        } else {
            let videoDevices = AVCaptureDevice.DiscoverySession(
                deviceTypes: [.builtInWideAngleCamera],
                mediaType: .video,
                position: .unspecified
            ).devices
            
            if let frontCamera = videoDevices.first(where: { $0.position == .front }) {
                guard let input = try? AVCaptureDeviceInput(device: frontCamera) else { return }
                if session.canAddInput(input) {
                    session.addInput(input)
                }
                currentCamera = .front
            }
            
        }
        
        session.commitConfiguration()
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        // Check for recording error
        if let error = error {
            print("Error recording: \(error.localizedDescription)")
            return
        }
        
        // Save video to Photos
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: outputFileURL)
        }) { saved, error in
            if saved {
                print("Successfully saved video to Photos.")
            } else if let error = error {
                print("Error saving video to Photos: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    VideoRecordingView()
}



