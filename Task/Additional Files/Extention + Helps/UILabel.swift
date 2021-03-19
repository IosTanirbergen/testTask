//
//  UILabel.swift
//  Task
//
//  Created by Tanirbergen Kaldibai on 17.03.2021.
//

import UIKit

extension UILabel {
    func configureLabel(text: String, textColor: UIColor, textAlignment: NSTextAlignment, fontName: String, fontSize: CGFloat, numberOfLines: Int) {
        self.text = text
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.font = UIFont(name: fontName, size: fontSize)
        self.numberOfLines = numberOfLines
    }
    
    func setupBottomline(color: UIColor, label: UILabel) {
        let bottomView = UIView()
        addSubview(bottomView)
        bottomView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        bottomView.backgroundColor = color
        bottomView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        bottomView.anchor(top: label.bottomAnchor, leading: label.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        
       // bottomView.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
    }
}
