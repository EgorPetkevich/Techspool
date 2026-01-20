//
//  UILabel+Consts.swift
//  TechspoolProject
//
//  Created by George Popkich on 19.01.26.
//

import UIKit

extension UILabel {
    
    static func title(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.appTitleFont
        label.textColor = .secondaryLabel
        return label
    }
    
    static func bold(_ text: String, _ textSize: CGFloat, _ textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = UIFont.appBoldFont(textSize)
        return label
    }
    
    static func regular(_ text: String, _ textSize: CGFloat, _ textColor: UIColor = .secondaryLabel) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = UIFont.appRegularFont(textSize)
        return label
    }
    
}
