//
//  ViewController.swift
//  WeatherForecast
//
//  Created by user on 5.08.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var collection: UICollectionView!
    var weather: Daily? {
        didSet {
            DispatchQueue.main.async {[weak self] in
                self?.collection.reloadData()
            }
        }
    }
    
    let my = WeatherDecode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        setupCollection()
        collection.setCollectionViewLayout(generateLayout(), animated: true)
        my.getWeather() { [weak self] daily in
            self?.weather = daily
        }
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
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            group.contentInsets = .init(top: 10, leading: 20, bottom: 10, trailing: 20)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weather?.time.count ?? 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collection.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as? CustomCell else { return UICollectionViewCell()
        }
        cell.backgroundColor = .gray
        cell.configure(time: weather?.time[indexPath.row] ?? "n", tempMax: weather?.temperature2mMax[indexPath.row] ?? 9, tempMin: weather?.temperature2mMin[indexPath.row] ?? 9)
        return cell
    }
}

