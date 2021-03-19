//
//  FooterView.swift
//  Task
//
//  Created by Tanirbergen Kaldibai on 18.03.2021.
//

import UIKit

class FooterView: UIView, SetupView {
    
    // MARK: - Properties
    lazy var signUpButton = UIButton(type: .system)
    lazy var notificationLabel = UILabel()
    lazy var signInButton = UIButton(type: .system)
    lazy var xPosition = UIView()
    
    // MARK: - StackView
    lazy var signInStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            notificationLabel,
            signInButton
        ])
        sv.axis = .horizontal
        sv.spacing = -36
        return sv
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    // MARK: - Methods
    func setupView() {
        [signUpButton, signInStackView].forEach {
            addSubview($0)
        }
        signUpButton.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 16, bottom: 0, right: 16))
        
        signInStackView.anchor(top: signUpButton.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 16, left: 0, bottom: 0, right: 0))
       // signInStackView.centerXAnchor.constraint(equalTo: signUpButton.centerXAnchor).isActive = true
        notificationLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -20).isActive = true
        configureView()
        setupAction()
    }
    
    func configureView() {
        backgroundColor = .white
        signUpButton.configureButton(title: AppKeys.Strings.signUp, titleColor: .white, cornerRadius: 8, borderWidth: 0, borderColor: UIColor.cyan.cgColor, height: 50, backgroundColor: .tapsyrBlue)
        notificationLabel.configureLabel(text:  AppKeys.Strings.notification, textColor: .black, textAlignment: .center, fontName: "AppleSDGothicNeo-UltraLight", fontSize: 16, numberOfLines: 0)
        signInButton.configureButton(title: AppKeys.Strings.signIn, titleColor: .tapsyrBlue, cornerRadius: 0, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 16, backgroundColor: .clear)
    }
    
    func setupAction() {

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 
