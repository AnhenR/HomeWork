//
//  ReviewViewController.swift
//  Belarus
//
//  Created by user on 17.10.22.
//

import Foundation
import UIKit

class ReviewViewController: UIViewController, UIScrollViewDelegate {
    
    private var imageArray = [UIImage(named: "chechersk1"), UIImage(named: "chechersk2"), UIImage(named: "chechersk3"), UIImage(named: "chechersk4")]
    
    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cornflowers3")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Некалькі выдатных мясцін Беларусі, якія варта наведаць! Некалькі выдатных мясцін Беларусі, якія варта наведаць! Некалькі выдатных мясцін Беларусі, якія варта наведаць!"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.addShadow()
        return label
    }()
    
    private let weatherButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Надвор'е", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        button.alpha = 0.9
        button.addShadow()
        return button
    }()
    
    private let mapButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Карта", for: .normal)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 20
        button.alpha = 0.9
        button.addShadow()
        return button
    }()
    
    private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    private var placesCollection : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let a = descriptionLabel.getSize(constrainedWidth: scrollView.frame.width)
        print(a.width, "nnnnn", a.height)
        configureUI()
        setupScroll()
        setupCollection()
        placesCollection.delegate = self
        placesCollection.dataSource = self
        placesCollection.register(CustomCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollView.contentSize = CGSize(width: view.frame.width, height: descriptionLabel.getSize(constrainedWidth: view.frame.width).height)
    }
    
    private func setupCollection() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 450)
        layout.scrollDirection = .horizontal
        placesCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        placesCollection.backgroundColor = .clear
        placesCollection.isPagingEnabled = true
        view.addSubview(placesCollection)
        placesCollection.translatesAutoresizingMaskIntoConstraints = false
        placesCollection.heightAnchor.constraint(equalToConstant: 300).isActive = true
        placesCollection.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor).isActive = true
        placesCollection.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor).isActive = true
        placesCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
    }
    
    private func setupScroll() {
        view.addSubview(scrollView)
        scrollView.delegate = self
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -400)
        ])
        
//        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: descriptionLabel.getSize(constrainedWidth: scrollView.frame.width).width)
        scrollView.addSubview(descriptionLabel)
        view.bringSubviewToFront(scrollView)
    }
    
    private func configureUI() {
        view.addSubview(mainImage)
//        mainImage.addSubview(descriptionLabel)
        view.addSubview(weatherButton)
        view.addSubview(mapButton)
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
//            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            descriptionLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor),
//            descriptionLabel.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor),
//            descriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -400),

            weatherButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weatherButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            weatherButton.widthAnchor.constraint(equalToConstant: 100),
            weatherButton.heightAnchor.constraint(equalToConstant: 40),
            
            mapButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mapButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            mapButton.widthAnchor.constraint(equalToConstant: 100),
            mapButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        view.bringSubviewToFront(weatherButton)
        view.bringSubviewToFront(mapButton)
    }
}
extension ReviewViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! CustomCell
        cell.configure(newImage: imageArray[indexPath.row]!)
        return cell
    }
}

extension UILabel {
    func getSize(constrainedWidth: CGFloat) -> CGSize {
        return systemLayoutSizeFitting(CGSize(width: constrainedWidth, height: UIView.layoutFittingCompressedSize.height), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
    }
}

