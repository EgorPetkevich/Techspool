//
//  Coordinator.swift
//  TechspoolProject
//
//  Created by George Popkich on 19.01.26.
//

import UIKit

class Coordinator {
    
    var onDidFinish: ((Coordinator) -> Void)?
    
    var children: [Coordinator] = []
    
    func start() -> UIViewController {
        fatalError("Should be overriden")
    }
    
    func finish() {
        onDidFinish?(self)
    }
    
}

extension Coordinator: Equatable {
    
    static func == (lhs: Coordinator, rhs: Coordinator) -> Bool {
        return lhs === rhs
    }
    
}
