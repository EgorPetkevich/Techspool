//
//  UIFont+Consts.swift
//  TechspoolProject
//
//  Created by George Popkich on 19.01.26.
//

import UIKit

extension UIFont {
    
    static var appTitleFont: UIFont = UIFont(name: "Helvetica-Bold", size: 25)!
    
    static func appRegularFont (_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica", size: size)!
    }
    
    static func appBoldFont (_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-Bold", size: size)!
    }
    
}
