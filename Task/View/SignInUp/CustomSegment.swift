//
//  CustomSegmentController.swift
//  Task
//
//  Created by Tanirbergen Kaldibai on 18.03.2021.
//

import UIKit

class CustomSegment: UIView, SetupView{
    
    // MARK: - Properties
    lazy var firstSegmentLine = UIView()
    lazy var secondSegmentLine = UIView()
    
    lazy var signUpButton = UIButton(type: .system)
    lazy var signInButton = UIButton(type: .system)
    
    // MARK: - StackView
    lazy var segmentStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            firstSegmentLine,
            secondSegmentLine
        ])
        sv.axis = .horizontal
        sv.spacing = 0
        sv.distribution = .fillEqually
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    func setupView() {
        [segmentStackView, signUpButton, signInButton].forEach { (adding) in
            addSubview(adding)
        }
        
        signUpButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 4, left: 0, bottom: 0, right: 0))
        signInButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 4, left: 0, bottom: 0, right: 0))
        signUpButton.centerXAnchor.constraint(equalTo: firstSegmentLine.centerXAnchor).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: secondSegmentLine.centerXAnchor).isActive = true
        segmentStackView.anchor(top: signUpButton.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 14, left: 8, bottom: 0, right: 8))
        configureView()
        setupAction()
    }
    
    func configureView() {
        firstSegmentLine.heightAnchor.constraint(equalToConstant: 2.5).isActive = true
        secondSegmentLine.heightAnchor.constraint(equalToConstant: 2.5).isActive = true
        
        /// configure
        firstSegmentLine.backgroundColor = .tapsyrSegment
        secondSegmentLine.backgroundColor = .tapsyrBlue
        
        /// configureLabel
        signUpButton.configureButton(title: AppKeys.Strings.registration, titleColor: .lightGray, cornerRadius: 0, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 16, backgroundColor: .clear)
        signInButton.configureButton(title: AppKeys.Strings.authorization, titleColor: .tapsyrBlue, cornerRadius: 0, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 16, backgroundColor: .clear)
    }

    func setupAction() {}
    
    /// configure
    func signInHide() {
        UIView.animate(withDuration: 0.5) { [self] in
            firstSegmentLine.backgroundColor = .tapsyrBlue
            secondSegmentLine.backgroundColor = .tapsyrSegment
            self.layoutIfNeeded()
        }
    }
    
    func signUpHide() {
        UIView.animate(withDuration: 0.5) { [self] in
            firstSegmentLine.backgroundColor = .tapsyrSegment
            secondSegmentLine.backgroundColor = .tapsyrBlue
            self.layoutIfNeeded()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
