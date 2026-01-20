//
//  OnboardingAssembler.swift
//  TechspoolProject
//
//  Created by George Popkich on 19.01.26.
//

import UIKit

final class OnboardingAssembler {
    
    private init() {}
    
    static func make(coordinator: OnbCoordinatorProtocol) -> UIViewController {
        let adapter = OnbCardsAdapter()
        let vm = OnboardingVM(
            coordinator: coordinator,
            adapter: adapter
        )
        let vc = OnboardingVC(viewModel: vm)
        return vc
    }
    
}
