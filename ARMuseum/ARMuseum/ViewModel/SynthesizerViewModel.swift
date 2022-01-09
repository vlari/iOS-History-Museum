//
//  SynthesizerViewModel.swift
//  ARMuseum
//
//  Created by Obed Garcia on 8/1/22.
//

import Foundation
import AVFoundation

class SynthesizerViewModel: NSObject, ObservableObject {
    private var speechSynthesizer = AVSpeechSynthesizer()
    @Published var isSpeaking = false
    
    override init() {
        super.init()
        self.speechSynthesizer.delegate = self
    }
    
    func speak(from description: String) {
        let utterance = AVSpeechUtterance(string: description)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        speechSynthesizer.speak(utterance)
    }
    
    func silence() {
        speechSynthesizer.pauseSpeaking(at: .immediate)
    }
}

extension SynthesizerViewModel: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        self.isSpeaking = true
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        self.isSpeaking = false
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.isSpeaking = false
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        self.isSpeaking = true
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        self.isSpeaking = false
    }
}
