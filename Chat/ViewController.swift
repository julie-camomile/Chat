//
//  ViewController.swift
//  Chat
//
//  Created by y.o.alekseeva on 06.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logViewControllerLifeCycleFunction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        logViewControllerLifeCycleFunction()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        logViewControllerLifeCycleFunction()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        logViewControllerLifeCycleFunction()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        logViewControllerLifeCycleFunction()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        logViewControllerLifeCycleFunction()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        logViewControllerLifeCycleFunction()
    }
    
    // MARK: - Private
    
    private func logViewControllerLifeCycleFunction(name: String = #function) {
        print("UIViewController lifecycle method: \(name)")
    }
}

