//
//  OnboardingCoordinator.swift
//  TechspoolProject
//
//  Created by George Popkich on 19.01.26.
//

import UIKit

final class OnboardingCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    
    override func start() -> UIViewController {
        let vc = OnboardingAssembler.make(coordinator: self)
        self.rootVC = vc
        return vc
    }
    
}

extension OnboardingCoordinator: OnbCoordinatorProtocol { }
