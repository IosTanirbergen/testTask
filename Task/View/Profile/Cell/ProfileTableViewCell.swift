//
//  ProfileTableViewCell.swift
//  Task
//
//  Created by Tanirbergen Kaldibai on 19.03.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell, SetupView {
    // MARK: - Properties
    lazy var title = UILabel()
    lazy var subtitle = UILabel()
    
    var data: userInformation? {
        didSet {
            guard let data = data else {
                return
            }
            title.text = data.title
            subtitle.text = data.subTitle
    
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupView()
    }
    
    func setupView() {
        [title, subtitle].forEach {
            addSubview($0)
        }
        title.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 16, bottom: 0, right: 0))
        subtitle.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 16, bottom: 16, right: 0))
        configureView()
        setupAction()
    }
    
    func configureView() {
        backgroundColor = .white
        title.textColor = .lightGray
        subtitle.textColor = .black
        title.numberOfLines = 0
        subtitle.numberOfLines = 0
    }
    
    func setupAction() {}

}
