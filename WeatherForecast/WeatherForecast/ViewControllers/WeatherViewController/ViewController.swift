//
//  ViewController.swift
//  WeatherForecast
//
//  Created by user on 5.08.22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var losAngeles: UIButton!
    @IBOutlet weak var newYork: UIButton!
    @IBOutlet weak var berlin: UIButton!
    @IBOutlet weak var collection: UICollectionView!
    
    let viewModelWeather = ViewModelWeather()
    
    private var looper: AVPlayerLooper?
    
//  было
//    var weather: Daily? {
//        didSet {
//            DispatchQueue.main.async {[weak self] in
//                self?.collection.reloadData()
//            }
//        }
//    }
//    let my = WeatherDecode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLocalization()
        backgroundVideo()
        collection.dataSource = self
        collection.delegate = self
        setupCollection()
        collection.setCollectionViewLayout(generateLayout(), animated: true)
        view.bringSubviewToFront(collection)
        view.bringSubviewToFront(losAngeles)
        view.bringSubviewToFront(newYork)
        view.bringSubviewToFront(berlin)
        
    }
    
    private func setupCollection() {
        let nib = UINib(nibName: String(describing: CustomCell.self), bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (section, layoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(220))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            group.contentInsets = .init(top: 10, leading: 20, bottom: 10, trailing: 20)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
    }
    
    private func makeLocalization() {
        losAngeles.setTitle(L10n.firstCity, for: .normal)
        newYork.setTitle(L10n.secondCity, for: .normal)
        berlin.setTitle(L10n.thirdCity, for: .normal)
    }
    
    private func backgroundVideo() {
            guard let videoURL = Bundle.main.path(forResource: "myVideo", ofType: "mp4") else { return }
            let url = URL(fileURLWithPath: videoURL)
            do {
                let item = AVPlayerItem(url: url)
                let player = AVQueuePlayer(items: [item])
                looper = AVPlayerLooper(player: player, templateItem: item)
                let playerLayer = AVPlayerLayer(player: player)
                playerLayer.frame = view.bounds
                playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                view.layer.addSublayer(playerLayer)
                player.play()
            }
    }
    
    
    @IBAction func losAngelesAction(_ sender: Any) {
// было
//        my.getWeather(url:API.losAngeles) { [weak self] daily in
//            self?.weather = daily
//        }
        
//        viewModelWeather.loadDataLosAngeles(latitude: 40.71, longitude: -74.01, timeZone: "America%2FNew_York", daily:["temperature_2m_max","temperature_2m_min"])
    }
    
    @IBAction func newYorkAction(_ sender: Any) {
// было
//        my.getWeather(url:API.newYork) { [weak self] daily in
//            self?.weather = daily
//        }
        viewModelWeather.loadDataNewYork()
    }
    
    @IBAction func berlinAction(_ sender: Any) {
// было
//        my.getWeather(url:API.berlin) { [weak self] daily in
//            self?.weather = daily
//        }
        viewModelWeather.loadDataBerlin()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = viewModelWeather.bindWeather.lastValue?.time.count {
            return count
        }
          return 167
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collection.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as? CustomCell else { return UICollectionViewCell()
        }
        cell.backgroundColor = .gray
//    было
//        cell.configure(tempMax: weather?.temperature2mMax[indexPath.row] ?? 0, tempMin: weather?.temperature2mMin[indexPath.row] ?? 0)
        viewModelWeather.bindWeather.bind(\.time[indexPath.row], to: cell.dateLabel, \.text) { value in
            return "\(L10n.date): \(value)"
        }
        viewModelWeather.bindWeather.bind(\.temperature2m[indexPath.row], to: cell.tempLabel, \.text) { value in
            return "\(L10n.maxTemp): \(value)"
        }
        viewModelWeather.bindWeather.bind(\.apparentTemperature[indexPath.row], to: cell.minTempLabel, \.text) { value in
            return "\(L10n.minTemp): \(value)"
        }
        return cell
    }
}




