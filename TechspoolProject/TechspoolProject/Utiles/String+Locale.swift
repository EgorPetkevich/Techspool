//
//  String+Locale.swift
//  TechspoolProject
//
//  Created by George Popkich on 19.01.26.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    //MARK: Onboarding
    enum Onboarding {}
    
}
