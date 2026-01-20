//
//  MainCoordinator.swift
//  TechspoolProject
//
//  Created by George Popkich on 20.01.26.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    
    override func start() -> UIViewController {
        let vc = MainAssembler.make(coordinator: self)
        self.rootVC = vc
        return vc
    }
    
}

extension MainCoordinator: MainCoordinatorProtocol {
    
    func showOnboarding() {
        let coordinator = OnboardingCoordinator()
        children.append(coordinator)
        
        let vc = coordinator.start()
        
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { coordinator == $0 }
            vc.dismiss(animated: true)
        }
        
        vc.modalPresentationStyle = .fullScreen
        rootVC?.present(vc, animated: true)
    }
    
}
