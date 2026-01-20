//
//  Container.swift
//  TechspoolProject
//
//  Created by George Popkich on 19.01.26.
//

import Foundation

final class Container {
    
    private var lazyDependencies: [String: () -> Any] = [:]
    
    private var dependencies: [String: Any] = [:]
    
    func lazyRegister<T>(_ closure: @escaping () -> T) {
        lazyDependencies["\(T.self)"] = closure
    }
    
    func resolve<T>() -> T {
        if let deps = dependencies["\(T.self)"] {
            return deps as! T
        }
        
        let deps = lazyDependencies["\(T.self)"]?() as! T
        lazyDependencies["\(T.self)"] = nil
        
        dependencies["\(T.self)"] = deps
        
        return deps
    }
    
}
