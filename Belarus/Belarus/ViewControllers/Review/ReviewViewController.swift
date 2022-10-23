//
//  ReviewViewController.swift
//  Belarus
//
//  Created by user on 17.10.22.
//

import Foundation
import UIKit

class ReviewViewController: UIViewController, UIScrollViewDelegate {
    
    let viewModel: ReviewViewModel
    
    init(viewModel:ReviewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cornflowers3")
        image.contentMode = .scaleToFill
        image.isUserInteractionEnabled = true
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.addShadow()
        return label
    }()
    
    private let weatherButton: UIButton = {
        let button = UIButton()
        button.setTitle("Надвор'е", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(didTapWeather), for: .touchUpInside)
        return button
    }()
    
    private let mapButton: UIButton = {
        let button = UIButton()
        button.setTitle("Карта", for: .normal)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(didTapMap), for: .touchUpInside)
        return button
    }()
    
    private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    private var placesCollection : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupScroll()
        setupCollection()
        placesCollection.delegate = self
        placesCollection.dataSource = self
        placesCollection.register(CustomCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    private func setupCollection() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 500)
        layout.scrollDirection = .horizontal
        placesCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        placesCollection.backgroundColor = .clear
        placesCollection.isPagingEnabled = true
        mainImage.addSubview(placesCollection)
        placesCollection.translatesAutoresizingMaskIntoConstraints = false
        placesCollection.heightAnchor.constraint(equalToConstant: 300).isActive = true
        placesCollection.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor).isActive = true
        placesCollection.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor).isActive = true
        placesCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
    }
    
    private func setupScroll() {
        mainImage.addSubview(scrollView)
        mainImage.translatesAutoresizingMaskIntoSubviews()
        scrollView.delegate = self
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -400)
        ])
        descriptionLabel.text = viewModel.review.descriptionPlace
        scrollView.addSubview(descriptionLabel)
        scrollView.addShadowOnSubviews()
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureUI() {
        navigationItem.backButtonTitle = "Выйсці"
        view.addSubview(mainImage)
        view.translatesAutoresizingMaskIntoSubviews()
        mainImage.addSubviews(weatherButton, mapButton)
        mainImage.translatesAutoresizingMaskIntoSubviews()
        mainImage.addAlpha()
        mainImage.addShadowOnSubviews()
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
            weatherButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weatherButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            weatherButton.widthAnchor.constraint(equalToConstant: 100),
            weatherButton.heightAnchor.constraint(equalToConstant: 40),
            
            mapButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mapButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            mapButton.widthAnchor.constraint(equalToConstant: 100),
            mapButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func didTapWeather() {
        navigationController?.pushViewController(WeatherViewController(), animated: true)
    }
    
    @objc private func didTapMap() {
        navigationController?.pushViewController(MapViewController(viewModel: .init(map: .init(latitude: viewModel.review.latitude, longitude: viewModel.review.longitude))), animated: true)
    }
}

extension ReviewViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.review.imagePlace.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! CustomCell
        cell.configure(newImage: viewModel.review.imagePlace[indexPath.row])
        return cell
    }
}

