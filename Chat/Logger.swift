//
//  Logger.swift
//  Chat
//
//  Created by y.o.alekseeva on 09.06.2021.
//

import Foundation

public protocol ILogger {
    func logAppLifeCycleFunction(name: String)
    func logAppStates(previous: String, current: String)
    func logViewControllerLifeCycleFunction(name: String)
}

public final class Logger: ILogger {
    
    public func logAppLifeCycleFunction(name: String = #function) {
        #if DEBUG
        print("Application lifecycle method: \(name)")
        #endif
    }
    
    public func logAppStates(previous: String, current: String) {
        #if DEBUG
        print("Application moved from \(previous) to \(current)\n")
        #endif
    }
    
    public func logViewControllerLifeCycleFunction(name: String = #function) {
        #if DEBUG
        print("UIViewController lifecycle method: \(name)")
        #endif
    }
}
