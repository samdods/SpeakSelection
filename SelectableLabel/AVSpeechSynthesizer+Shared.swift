//
//  AVSpeechSynthesizer+Shared.swift
//  SelectableLabel
//
//  Created by Sam Dods on 09/10/2019.
//  Copyright © 2019 Sam Dods. All rights reserved.
//

import Foundation
import AVFoundation

extension AVSpeechSynthesizer {
    
    static let forSpeakSelection: AVSpeechSynthesizer = {
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.delegate = SpeechDelegate.shared
        return synthesizer
    }()
}

// MARK: - Private

/// Delegate is used to deactivate the audio session when a synthesized utterance has finished.
private class SpeechDelegate: NSObject, AVSpeechSynthesizerDelegate {
    
    static let shared = SpeechDelegate()
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        try? AVAudioSession.sharedInstance().setActive(false)
    }
}
