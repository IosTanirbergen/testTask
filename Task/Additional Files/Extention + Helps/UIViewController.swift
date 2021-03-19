//
//  UINavigationController.swift
//  Task
//
//  Created by Tanirbergen Kaldibai on 17.03.2021.
//

import UIKit

extension UIViewController {
    func configureNavigationBar(isHidden: Bool, backgroundColor: UIColor,title: String) {
        self.navigationController?.navigationBar.isHidden = isHidden
        self.navigationController?.navigationBar.backgroundColor = backgroundColor
        self.navigationController?.navigationItem.title = title
    }
    
    func setupRightLabel() {
        let label = UILabel()
        label.text = AppKeys.Strings.rights
        view.addSubview(label)
        label.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: nil)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 16)
    }
}
