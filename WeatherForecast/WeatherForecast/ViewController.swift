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
    
//    let time = UserDefaults.standard.value(forKey: .time) as? [String]
//    let tempMax = UserDefaults.standard.value(forKey: .tempMax) as? [Float]
//    let tempMin = UserDefaults.standard.value(forKey: .tempMin) as? [Float]
    
    let my = WeatherDecode()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collection.dataSource = self
        collection.delegate = self
        setupCollection()
        collection.setCollectionViewLayout(generateLayout(), animated: true)
//        print(tempMin)
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
//        return time?.count ?? 7
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collection.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as? CustomCell else { return UICollectionViewCell()
        }
        cell.backgroundColor = .gray
//        cell.configure(time: time?[indexPath.row] ?? "000", tempMax: tempMax?[indexPath.row] ?? 99, tempMin: tempMin?[indexPath.row] ?? 99)
        my.callBack = { [weak self] myDate in
            cell.configure(time: "ccc", tempMax: myDate[indexPath.row], tempMin: 66)
        }
//        cell.configure(time: "hhh", tempMax: 8, tempMin: 7)
        return cell
    }
}

