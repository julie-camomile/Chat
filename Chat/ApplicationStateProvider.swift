//
//  ApplicationStateProvider.swift
//  Chat
//
//  Created by y.o.alekseeva on 09.06.2021.
//

import UIKit

public final class ApplicationStateProvider {
    
    private let logger: ILogger
    public private(set) var appState = "Not running"
    
    init(logger: ILogger = Logger()) {
        self.logger = logger
    }
    
    public func update(appState newAppState: String, funcName: String = #function) {
        logger.logAppLifeCycleFunction(name: funcName)
        logger.logAppStates(previous: self.appState, current: newAppState)
        
        self.appState = newAppState
    }
}

extension ApplicationStateProvider {
    public static let shared = ApplicationStateProvider()
}
