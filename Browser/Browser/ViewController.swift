//
//  ViewController.swift
//  Browser
//
//  Created by user on 22.07.22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    private let backgroundView = UIView()
    private let backButton = UIButton()
    private let forwardButton = UIButton()
    private let stopButton = UIButton()
    private var bottomStopButton: NSLayoutConstraint?
    private let goButton = UIButton()
    private let reloadButton = UIButton()
    private var bottomReloadButton: NSLayoutConstraint?
    private let textField = UITextField()
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        makeUI()
        showKeyboard()
    }
    
    private func makeUI() {
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            backgroundView.bottomAnchor.constraint(equalTo: webView.topAnchor, constant: -10),
            
            backButton.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            
            forwardButton.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            forwardButton.leadingAnchor.constraint(equalTo: backButton.trailingAnchor),
            forwardButton.widthAnchor.constraint(equalToConstant: 40),
            forwardButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            
            goButton.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            goButton.leadingAnchor.constraint(equalTo: forwardButton.trailingAnchor,constant: 5),
            goButton.widthAnchor.constraint(equalToConstant: 40),
            goButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            
            textField.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            textField.leadingAnchor.constraint(equalTo: goButton.trailingAnchor, constant: 5),
            textField.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            webView.bottomAnchor.constraint(equalTo: stopButton.topAnchor, constant: -5),
            
            stopButton.heightAnchor.constraint(equalToConstant: 30),
            stopButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            
            reloadButton.leadingAnchor.constraint(equalTo: stopButton.trailingAnchor, constant: 5),
            reloadButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            reloadButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        bottomStopButton = stopButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        bottomStopButton?.isActive = true
        
        bottomReloadButton = reloadButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        bottomReloadButton?.isActive = true
    }
    
    private func configureUI() {
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("<", for: .normal)
        backButton.layer.cornerRadius = 10
        backButton.backgroundColor = .gray
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        
        view.addSubview(forwardButton)
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        forwardButton.setTitle(">", for: .normal)
        forwardButton.layer.cornerRadius = 10
        forwardButton.backgroundColor = .gray
        forwardButton.addTarget(self, action: #selector(didTapForward), for: .touchUpInside)
        
        view.addSubview(stopButton)
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.setTitle("stop", for: .normal)
        stopButton.layer.cornerRadius = 30
        stopButton.backgroundColor = .red
        stopButton.addTarget(self, action: #selector(didTapStop), for: .touchUpInside)
        
        view.addSubview(reloadButton)
        reloadButton.translatesAutoresizingMaskIntoConstraints = false
        reloadButton.setImage(UIImage(named: "reload"), for: .normal)
        reloadButton.addTarget(self, action: #selector(didTapReload), for: .touchUpInside)
        
        view.addSubview(goButton)
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.setTitle("go", for: .normal)
        goButton.layer.cornerRadius = 10
        goButton.backgroundColor = .darkGray
        goButton.addTarget(self, action: #selector(didTapGo), for: .touchUpInside)
        
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter a query"
        textField.textAlignment = .left
    }
    
    private func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    
    private func showKeyboard() {
        let showNotification = UIResponder.keyboardWillShowNotification
        NotificationCenter.default.addObserver(forName: showNotification, object: nil, queue: .main) { notification in
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.bottomStopButton?.constant = -(keyboardSize.height + 5)
                self.bottomReloadButton?.constant = -(keyboardSize.height + 5)
                UIView.animate(withDuration: 5.0) {
                    self.view.layoutIfNeeded()
                }
            }
        }
        
        let hideNotification = UIResponder.keyboardWillHideNotification
        NotificationCenter.default.addObserver(forName: hideNotification, object: nil, queue: .main) { _ in
            self.bottomStopButton?.constant = -10
            self.bottomReloadButton?.constant = -10
            UIView.animate(withDuration: 5.0) {
                self.view.layoutIfNeeded()
            }
        }
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))
    }
    
    func webViewBack(_ webView: WKWebView, didFinish navigation: WKNavigation!) { // triggers when loading is complete
        backButton.isHidden = !webView.canGoBack
    }
    
    @objc private func didTapView() {
        view.endEditing(true)
    }
    
    @objc func didTapBack() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func didTapForward() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc func didTapStop() {
        webView.stopLoading()
    }
    
    @objc func didTapReload() {
        webView.reload()
    }
    
    @objc func didTapGo() {
        guard var string = textField.text else { return }
        if !verifyUrl(urlString: string)  {
            string = "http://google.com/search?q=" + string.trimmingCharacters(in: .whitespaces)
        }
        guard let url = URL(string: string) else {print ("error")
            return}
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
}

