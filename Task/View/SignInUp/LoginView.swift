//
//  LoginView.swift
//  Task
//
//  Created by Tanirbergen Kaldibai on 19.03.2021.
//

import UIKit

class LoginView: UIView, SetupView {
    
    // MARK: - Properties
    lazy var emailTextField = UITextField()
    lazy var emailLabel = UILabel()
    lazy var passwordTextField = UITextField()
    lazy var passwordLabel = UILabel()
    lazy var nextButton = UIButton(type: .system)
    
    // MARK: - StackView
    lazy var emailStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            emailLabel,
            emailTextField
        ])
        sv.axis = .vertical
        sv.spacing = 8
        return sv
    }()
    
    lazy var passwordStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            passwordLabel,
            passwordTextField
        ])
        sv.axis = .vertical
        sv.spacing = 8
        return sv
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    func setupView() {
        [emailStackView, passwordStackView, nextButton].forEach {
            addSubview($0)
        }
        
        emailStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 12, left: 8, bottom: 0, right: 8))
        passwordStackView.anchor(top: emailStackView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 8, bottom: 0, right: 8))
        nextButton.anchor(top: passwordStackView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 48, left: 8, bottom: 0, right: 8))
        nextButton.shadowView()
        configureView()
        setupAction()
    }
    
    func configureView() {
        /// configureLabel
        emailLabel.configureLabel(text: AppKeys.Strings.email, textColor: .black, textAlignment: .natural, fontName: "TimesNewRoman", fontSize: 16, numberOfLines: 0)
        emailTextField.configureTextField(placeholder: AppKeys.Strings.emailPlaceholder, cornerRadius: 8, textColor: .black, font: "TimesNewRoman", fontSize: 16, height: 50, textAlignment: .center)
        emailTextField.configureTextFieldBorder(borderWith: 1.0, borderColor: .tapsyrSegment)
        emailTextField.shadowView()
        
        passwordLabel.configureLabel(text: AppKeys.Strings.password, textColor: .black, textAlignment: .natural, fontName: "TimesNewRomanRegular", fontSize: 16, numberOfLines: 0)
        passwordTextField.configureTextField(placeholder: AppKeys.Strings.passwordPlaceholder, cornerRadius: 8, textColor: .black, font: "TimesNewRoman", fontSize: 16, height: 50, textAlignment: .center)
        passwordTextField.configureTextFieldBorder(borderWith: 1.0, borderColor: .tapsyrSegment)
        passwordTextField.shadowView()
        
        /// configureButton
        nextButton.configureButton(title: AppKeys.Strings.next, titleColor: .gray, cornerRadius: 8, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 50, backgroundColor: .tapsyrSegment)
        nextButton.isEnabled = false
    }
    
    func setupAction() {
        emailTextField.addTarget(self, action: #selector(handleChangeValue), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handleChangeValue), for: .editingChanged)
    }
    
    /// validation
    @objc fileprivate func handleChangeValue() {
        let textSize = (emailTextField.text!.count != 0) && (passwordTextField.text!.count != 0)
        switch textSize {
        case (0 != 0):
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard self == self else { return }
                self!.nextButton.validationStateButton(isEnable: false, backgroundColor: .tapsyrSegment, titleColor: .gray)
            }
        default:
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard self == self else { return }
                self!.nextButton.validationStateButton(isEnable: true, backgroundColor: .tapsyrBlue, titleColor: .white)
            }
        }
    }
    
    func removeSignInSubview() {
        UIView.animate(withDuration: 0.2) { [self] in
            [emailStackView, passwordStackView].forEach { (hide) in
                hide.alpha = 0            }
            self.layoutIfNeeded()
        }
    }
    
    func removeSignUpSubview() {
        
    }
    
    func setupSignInSubview() {
        UIView.animate(withDuration: 0.2) { [self] in
            [emailStackView, passwordStackView].forEach { (show) in
                show.alpha = 1
            }
            self.layoutIfNeeded()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
