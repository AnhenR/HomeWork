//
//  ImageController.swift
//  Xib
//
//  Created by user on 18.07.22.
//

import Foundation
import UIKit

class ImageController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    private let dismissButton = UIButton()
    private let addPhotoButton = UIButton()
    private let scrollView = UIScrollView()
    private var bottomBackgroundView: NSLayoutConstraint?
    private let backgroundView = UIView()
    private let likeButton = UIButton()
    private let commentField = UITextField()
//    private lazy var imageArray = [UIImage(named: "природа1"), UIImage(named: "природа2"), UIImage(named: "природа3"),UIImage(named: "природа4")]
    private lazy var imageViewArray = [makeImageView(with: UIImage(named: "природа1") ?? UIImage()), makeImageView(with: UIImage(named: "природа2") ?? UIImage()), makeImageView(with: UIImage(named: "природа3") ?? UIImage()), makeImageView(with: UIImage(named: "природа4") ?? UIImage())]
    
//    private var collectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        configUI()
        scrollViewSetting()
        showKeyboard()
        
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        setupCollection()
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[.originalImage] as? UIImage {
//            imageViewArray.append(image)
//        }
//        picker.dismiss(animated: true)
//    }
    
//    private func setupCollection() {
//        let nib = UINib(nibName: String(describing: CustomCollectionCell.self), bundle: nil)
//        collectionView.register(nib, forCellWithReuseIdentifier: CustomCollectionCell.reuseIdentifier)
//    }
    
    private func configUI() {
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dismissButton.widthAnchor.constraint(equalToConstant: 30),
            dismissButton.heightAnchor.constraint(equalToConstant: 30),
            
            addPhotoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            addPhotoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addPhotoButton.widthAnchor.constraint(equalToConstant: 30),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 30),
            
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backgroundView.heightAnchor.constraint(equalToConstant: 40),
            
            commentField.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            commentField.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            commentField.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            commentField.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: -10),
            
            likeButton.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            likeButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            likeButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            likeButton.widthAnchor.constraint(equalToConstant: 30),
            
//            collectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        bottomBackgroundView = backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        bottomBackgroundView?.isActive = true
    }
    
    private func makeUI() {
        view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.setBackgroundImage(UIImage(named: "dismiss"), for: .normal)
        dismissButton.addTarget(self, action: #selector(didTapDismiss), for: .touchUpInside)
        
        view.addSubview(addPhotoButton)
        addPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        addPhotoButton.setBackgroundImage(UIImage(named: "add"), for: .normal)
        addPhotoButton.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        
        view .addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setBackgroundImage(UIImage(named: "beforeLike"), for: .normal)
        likeButton.setBackgroundImage(UIImage(named: "afterLike"), for: .selected)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        
        backgroundView.addSubview(commentField)
        commentField.translatesAutoresizingMaskIntoConstraints = false
        commentField.backgroundColor = .gray
        commentField.placeholder = "Speak out!"
        commentField.textAlignment = .left
        commentField.keyboardAppearance = .dark
        
//        scrollView.addSubview(collectionView)
//        collectionView.isScrollEnabled = false
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func scrollViewSetting() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: backgroundView.topAnchor, constant: -5)
        ])
        imageViewArray.enumerated().forEach{ index, item in
            imageViewArray[index].heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
            imageViewArray[index].widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            imageViewArray[index].topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            imageViewArray[index].leadingAnchor.constraint(equalTo: index == 0 ? scrollView.leadingAnchor : imageViewArray[index - 1].trailingAnchor).isActive = true
            scrollView.contentSize = CGSize(width: (view.frame.width * CGFloat(index + 1)), height: scrollView.frame.height)
        }
    }
    
    private func showKeyboard() {
        let showNotification = UIResponder.keyboardWillShowNotification
        NotificationCenter.default.addObserver(forName: showNotification, object: nil, queue: .main) { notification in
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.bottomBackgroundView?.constant = -(keyboardSize.height + 10.0)
                UIView.animate(withDuration: 5.0) {
                    self.view.layoutIfNeeded()
                }
            }
        }
        
        let hideNotification = UIResponder.keyboardWillHideNotification
        NotificationCenter.default.addObserver(forName: hideNotification, object: nil, queue: .main) { _ in
            self.bottomBackgroundView?.constant = -30
            UIView.animate(withDuration: 5.0) {
                self.view.layoutIfNeeded()
            }
        }
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))
    }
    
    private func makeImageView(with image: UIImage) -> UIImageView {
            let myImage = UIImageView()
            scrollView.addSubview(myImage)
            myImage.image = image
            myImage.translatesAutoresizingMaskIntoConstraints = false
            myImage.contentMode = .scaleAspectFit
            return myImage
        }
    
    @objc private func didTapDismiss() {
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc private func didTapAdd() {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        pickerController.delegate = self
        present(pickerController, animated: true)
    }
    
    @objc private func didTapLike() {
        likeButton.isSelected = likeButton.isSelected ? false : true
    }
    
    @objc private func didTapView() {
        view.endEditing(true)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset == CGPoint(x: scrollView.contentSize.width - view.frame.width + 3, y: 0)  {
//            scrollView.contentOffset = CGPoint(x: 0, y: 0)
//        }
        if scrollView.contentOffset.x >= scrollView.contentSize.width - view.frame.width + 20 {
            scrollView.contentOffset = CGPoint(x: 0, y: 0)
        }
    }
}

//extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[.originalImage] as? UIImage {
//
//        }
//        picker.dismiss(animated: true)
//    }
//}
extension ViewController:UIScrollViewDelegate {
    
         // 1. Вызывается в реальном времени при прокрутке scrollView
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
                 print ("Прокрутка")
        print(scrollView.contentOffset)
        
        
    }
         // 2. Вызывается, когда scrollView собирается начать перетаскивание
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
                 print ("начнет перетаскивать")
    }
         // 3. Звонит тот, который прекратит перетаскивать (отпускание руки не означает прекращение прокрутки)
         // Параметр 2: скорость по оси x и по оси y при отпускании руки
         // Параметр 3: предварительно оцененное смещение при остановке прокрутки
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
                 print ("перетащить перестанет")
  
    }
    
         // 4. Он будет вызываться при остановке замедления (по сути, он вызывается при остановке прокрутки)
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
                 print ("Вызывается при остановке замедления")
    }
    
         // 5. Вызывается, когда рука собирается прекратить перетаскивать
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
                 print ("начнёт замедляться")
    }
    
         // 6. Вызывается, когда анимация прокрутки была остановлена
         // Этот метод вызывается только тогда, когда scrollView прокручивается с использованием эффекта анимации метода setContentOffset, и когда прокрутка остановлена
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
                 print ("Остановить прокрутку анимации")
    }
    
         // 7. Используется только в том случае, если строка состояния автоматически прокручивается вверх при нажатии на строку состояния.
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
                 print ("прокручен вверх")
    }
}

//extension ImageController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return imageArray.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionCell.reuseIdentifier, for: indexPath) as? CustomCollectionCell else { return UICollectionViewCell()
//        }
//        cell.makeImage(with: imageArray[indexPath.row]!)
//        return cell
//    }
//}

