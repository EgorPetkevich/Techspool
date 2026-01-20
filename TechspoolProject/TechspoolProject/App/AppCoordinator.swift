//
//  AppCoordinator.swift
//  TechspoolProject
//
//  Created by George Popkich on 19.01.26.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private let container: Container
    private let windowManager: WindowManager
    
    init(container: Container) {
        self.container = container
        self.windowManager = container.resolve()
    }
    
    func startApp() {
        //MARK: uncomment for Testing
        ParametersHelper.set(.onboardDidFinish, value: false)
        openMainModule()
    }
    
}

//MARK: - Private

private extension AppCoordinator {
    
    func openMainModule() {
        let coordinator = MainCoordinator()
        children.append(coordinator)
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { $0 == coordinator }
            self?.startApp()
        }
        let vc = coordinator.start()
        let window = windowManager.get(type: .main)
        window.rootViewController = vc
        windowManager.show(type: .main)
    }
    
    func openOnboardingModule() {
        let coordinator = OnboardingCoordinator()
        children.append(coordinator)
        coordinator.onDidFinish = { [weak self] coordinator in
            self?.children.removeAll { $0 == coordinator }
            self?.startApp()
        }
        let vc = coordinator.start()
        let window = windowManager.get(type: .main)
        window.rootViewController = vc
        windowManager.show(type: .main)
    }
    
}
