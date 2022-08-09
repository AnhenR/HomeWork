//
//  ViewController.swift
//  Геолокация
//
//  Created by user on 8.08.22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate , AVAudioRecorderDelegate {
    
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var record: UIButton!
    
    @IBOutlet weak var playLife: UIButton!
    @IBOutlet weak var playTravel: UIButton!
    @IBOutlet weak var playCountries: UIButton!
    
    private var audioPlayer: AVAudioPlayer?
    private var recorder: AVAudioRecorder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecorder()
        play.isEnabled = false
    }
    
    private func myDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    private func setupRecorder() {
        let audioFileName = myDirectory().appendingPathComponent("myAudio.m4a")
        let recordSetting = [ AVFormatIDKey : kAudioFormatAppleLossless,
                   AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
                        AVEncoderBitRateKey : 320000,
                      AVNumberOfChannelsKey : 2,
                            AVSampleRateKey : 44100.2] as [String : Any]
        
        do {
            recorder = try AVAudioRecorder(url: audioFileName, settings: recordSetting )
            recorder?.delegate = self
            recorder?.prepareToRecord()
        } catch {
            print(error)
        }
    }
    
    private func setupPlayer() {
        let audioFilename = myDirectory().appendingPathComponent("myAudio.m4a")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFilename)
        } catch {
            print(error)
        }
    }
    
    private func setupCountries() {
        guard let path = Bundle.main.path(forResource: "countries", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            print(error)
        }
    }
    
    private func setupTravel() {
        guard let path = Bundle.main.path(forResource: "travelItems", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            print(error)
        }
    }
    
    private func setupLife() {
        guard let path = Bundle.main.path(forResource: "lifestyle", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            print(error)
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        play.isEnabled = true
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        record.isEnabled = true
        play.setTitle("Play", for: .normal)
    }
    
    
    @IBAction func recordButtonAction(_ sender: Any) {
        if record.titleLabel?.text == "Record" {
            recorder?.record()
            record.setTitle("Stop", for: .normal)
            play.isEnabled = false
            playLife.isEnabled = false
            playTravel.isEnabled = false
            playCountries.isEnabled = false
        } else {
            recorder?.stop()
            record.setTitle("Record", for: .normal)
            play.isEnabled = false
            playLife.isEnabled = true
            playTravel.isEnabled = true
            playCountries.isEnabled = true
        }
    }
    
    @IBAction func playButtonAction(_ sender: Any) {
        if play.titleLabel?.text == "Play" {
            play.setTitle("Pause", for: .normal)
            record.isEnabled = false
            setupPlayer()
            audioPlayer?.play()
        } else {
            audioPlayer?.pause()
            play.setTitle("Play", for: .normal)
            record.isEnabled = true
        }
    }
    
    @IBAction func countriesButton(_ sender: Any) {
        if playCountries.titleLabel?.text == "Play" {
            playCountries.setTitle("Stop", for: .normal)
            record.isEnabled = false
            playTravel.isEnabled = false
            playLife.isEnabled = false
            setupCountries()
            audioPlayer?.play()
        } else {
            audioPlayer?.stop()
            playCountries.setTitle("Play", for: .normal)
            playTravel.isEnabled = true
            playLife.isEnabled = true
            record.isEnabled = true
        }
    }
    
    @IBAction func travelButton(_ sender: Any) {
        if playTravel.titleLabel?.text == "Play" {
            playTravel.setTitle("Stop", for: .normal)
            record.isEnabled = false
            playLife.isEnabled = false
            playCountries.isEnabled = false
            setupTravel()
            audioPlayer?.play()
        } else {
            audioPlayer?.stop()
            playTravel.setTitle("Play", for: .normal)
            record.isEnabled = true
            playLife.isEnabled = true
            playCountries.isEnabled = true
        }
    }
    
    @IBAction func lifeButton(_ sender: Any) {
        if playLife.titleLabel?.text == "Play" {
            playLife.setTitle("Stop", for: .normal)
            record.isEnabled = false
            playTravel.isEnabled = false
            playCountries.isEnabled = false
            setupLife()
            audioPlayer?.play()
        } else {
            audioPlayer?.stop()
            playLife.setTitle("Play", for: .normal)
            record.isEnabled = true
            playTravel.isEnabled = true
            playCountries.isEnabled = true
        }
    }
}


extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius }
    }
}


