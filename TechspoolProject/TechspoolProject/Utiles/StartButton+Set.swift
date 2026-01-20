//
//  StartButton+Set.swift
//  TechspoolProject
//
//  Created by George Popkich on 20.01.26.
//

import Foundation

extension StartButton {
    
    @discardableResult
    func setTitle(_ title: String) -> StartButton {
        self.title = title
        return self
    }
    
}
