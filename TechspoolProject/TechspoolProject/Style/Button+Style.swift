//
//  Button+Style.swift
//  TechspoolProject
//
//  Created by George Popkich on 20.01.26.
//

import UIKit

extension UIButton {
    
    static func textButton(
        title: String,
        titleColor: UIColor = .label,
        titleFont: UIFont = .appRegularFont(14),
        backgroundColor: UIColor = .clear,
        cornerRadius: CGFloat = 10
    ) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = titleFont
        button.backgroundColor = backgroundColor
        return button
    }
    
}
