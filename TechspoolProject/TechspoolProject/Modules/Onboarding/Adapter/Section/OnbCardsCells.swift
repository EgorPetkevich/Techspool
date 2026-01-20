//
//  OnbCardsCells.swift
//  TechspoolProject
//
//  Created by George Popkich on 20.01.26.
//

import UIKit

enum OnbCardsCells: CaseIterable {
    
    case first
    case second
    case third
    
    var icon: UIImage {
        switch self {
        case .first: return .onbCardIconFirst
        case .second: return .onbCardIconSecond
        case .third : return .onbCardIconThird
        }
    }
    
    var description: String {
        switch self {
        case .first: return .Onboarding.firstCardDescription
        case .second: return .Onboarding.secondCardDescription
        case .third : return .Onboarding.thirdCardDescription
        }
    }
    
    var subtitle: String {
        switch self {
        case .first: return .Onboarding.firstCardSubtitle
        case .second: return .Onboarding.secondCardSubtitle
        case .third: return .Onboarding.thirdCardSubtitle
        }
    }
    
}

extension OnbCardsCells: OnbCardCellProtocol {}
