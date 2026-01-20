//
//  MainVM.swift
//  TechspoolProject
//
//  Created by George Popkich on 20.01.26.
//

import Foundation

protocol MainCoordinatorProtocol {
    func showOnboarding()
}

final class MainVM: MainViewModelProtocol {
    
    var mainTitleText: ((String) -> Void)?
    
    private let coordinator: MainCoordinatorProtocol
    
    init(coordinator: MainCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func viewWillAppear() {
        mainTitleText?(getButtonTitle())
    }
    
    func getButtonTitle() -> String {
        return ParametersHelper.get(.onboardDidFinish) ? "Добро пожаловать обратно" : "Показать онбординг"
       
    }
    
    func mainButtonDidTap() {
        coordinator.showOnboarding()
    }
    
}
