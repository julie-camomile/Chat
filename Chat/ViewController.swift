//
//  ViewController.swift
//  Chat
//
//  Created by y.o.alekseeva on 06.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var logger: ILogger? = Logger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logViewControllerFunction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        logViewControllerFunction()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        logViewControllerFunction()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        logViewControllerFunction()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        logViewControllerFunction()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        logViewControllerFunction()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        logViewControllerFunction()
    }
    
    // MARK: - Private
    
    private func logViewControllerFunction(name: String = #function) {
        logger?.logViewControllerLifeCycleFunction(name: name)
    }
}

