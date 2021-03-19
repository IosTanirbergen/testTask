//
//  HeaderView.swift
//  Task
//
//  Created by Tanirbergen Kaldibai on 19.03.2021.
//

import UIKit

class HeaderView: UIView, SetupView {
    // MARK: - Properties
    lazy var profileTitle = UILabel()
    lazy var userImage = UIImageView(image: #imageLiteral(resourceName: "🖼 profile-image"))
    lazy var userNameLabel = UILabel()
    lazy var settingProfileButton = UIButton(type: .system)
    
    // MARK: - StackView
    lazy var userProfileSettingStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            userNameLabel,
            settingProfileButton
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
    
    // MARK: - Methods
    func setupView() {
        [profileTitle, userImage, userProfileSettingStack].forEach {
            addSubview($0)
        }
        
        profileTitle.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
        profileTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        userImage.anchor(top: profileTitle.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 12, bottom: 0, right: 0))
        userProfileSettingStack.anchor(top: nil, leading: userImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        userProfileSettingStack.centerYAnchor.constraint(equalTo: userImage.centerYAnchor).isActive = true
        configureView()
        setupAction()
    }
    
    func configureView() {
        profileTitle.configureLabel(text: AppKeys.Strings.profile, textColor: .black, textAlignment: .center, fontName: "AppleSDGothicNeo-UltraLight", fontSize: 28, numberOfLines: 0)
        userNameLabel.configureLabel(text: "Testovich Test", textColor: .black, textAlignment: .natural, fontName: "AppleSDGothicNeo-UltraLight", fontSize: 20, numberOfLines: 0)
        settingProfileButton.configureButton(title: AppKeys.Strings.settingProfile, titleColor: .tapsyrBlue, cornerRadius: 0, borderWidth: 0, borderColor: UIColor.clear.cgColor, height: 16, backgroundColor: .clear)
    }
    
    func setupAction() {
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
