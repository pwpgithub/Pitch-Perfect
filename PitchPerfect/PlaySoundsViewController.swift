//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Ping Wu on 10/06/2017.
//  Copyright © 2017 SHDR. All rights reserved.
//

import UIKit
import AVFoundation

//MARK: - PlaySoundsViewController: UIViewController

class PlaySoundsViewController: UIViewController {
    
    //MARK:
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL : URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    //MARK: enum ButtyonType: Int
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    //MARK: playSoundForButton
    
    @IBAction func playSoundForButton (_ sender: UIButton) {
        switch (ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
    }
    
    // MARK: stopButtonPressed
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        stopAudio()
    }

    // MARK: Liftcycle Views
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupAudio()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureUI(.notPlaying)
    }

    }
