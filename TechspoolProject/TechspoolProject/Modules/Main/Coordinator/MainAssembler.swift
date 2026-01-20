//
//  MainAssembler.swift
//  TechspoolProject
//
//  Created by George Popkich on 20.01.26.
//

import UIKit

final class MainAssembler {
    
    private init() {}
    
    static func make(coordinator: MainCoordinatorProtocol) -> UIViewController {
        let vm = MainVM(coordinator: coordinator)
        let vc = MainVC(viewModel: vm)
        return vc
    }
    
}
