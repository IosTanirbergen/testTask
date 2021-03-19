//
//  FirstCollectionViewCell.swift
//  Task
//
//  Created by Tanirbergen Kaldibai on 18.03.2021.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    lazy var cellImageView = UIImageView(image: #imageLiteral(resourceName: "1").withRenderingMode(.alwaysOriginal))
    lazy var titleLabel = UILabel()
    lazy var subtitleLabel = UILabel()
    
    // MARK: - StackView
    lazy var titleStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            titleLabel,
            subtitleLabel
        ])
        sv.axis = .vertical
        sv.spacing = 12
        return sv
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    
    func setupView() {
        [cellImageView, titleStackView].forEach {
            addSubview($0)
        }
        cellImageView.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 40, left: 0, bottom: 0, right: 0))
        titleStackView.anchor(top: cellImageView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 52, left: 0, bottom: 0, right: 0))
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cellImageView.configureSizeView(height: 171, width: 200)
        cellImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        configureView()
        setupAction()
    }
    
    func configureView() {
        backgroundColor = .white
        titleLabel.configureLabel(text: AppKeys.Strings.firstTitle, textColor: .black, textAlignment: .center, fontName: "AppleSDGothicNeo-UltraLight", fontSize: 20, numberOfLines: 0)
        subtitleLabel.configureLabel(text: AppKeys.Strings.firstSubTitle, textColor: .lightGray, textAlignment: .center, fontName: "AppleSDGothicNeo-UltraLight", fontSize: 16, numberOfLines: 0)
    }
    
    func setupAction() {
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
