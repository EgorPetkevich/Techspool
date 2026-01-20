//
//  UIButton+Actions.swift
//  TechspoolProject
//
//  Created by George Popkich on 20.01.26.
//

import UIKit

extension UIButton {
    
    @discardableResult
    func withAction(
        _ target: Any?,
        _ selector: Selector,
        for event: UIControl.Event = .touchUpInside
    ) -> UIButton {
        self.addTarget(target, action: selector, for: event)
        return self
    }
    
}
