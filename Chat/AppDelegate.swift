//
//  AppDelegate.swift
//  Chat
//
//  Created by y.o.alekseeva on 06.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var previousAppState = "Not running"
    
    // MARK: - Launching an app into the foreground
    
    // Launch time - First initialization
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        logAppLifeCycleFunction()
        logAppStates(previous: previousAppState, current: application.applicationState.name)
        return true
    }
    
    // Launch time - Final initialization
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        logAppLifeCycleFunction()
        logAppStates(previous: previousAppState, current: application.applicationState.name)
        return true
    }
    
    // Running - Activate the app
    func applicationDidBecomeActive(_ application: UIApplication) {
        logAppLifeCycleFunction()
        logAppStates(previous: previousAppState, current: application.applicationState.name)
    }
    
    // MARK: - Launching an app into the background
    
    // Background - Enter Background
    func applicationDidEnterBackground(_ application: UIApplication) {
        logAppLifeCycleFunction()
        logAppStates(previous: previousAppState, current: application.applicationState.name)
    }
    
    // MARK: - Moving from the foreground to the background
    
    // Foreground - Deactivate the app (ex. switch to a different app / tap Home button)
    func applicationWillResignActive(_ application: UIApplication) {
        logAppLifeCycleFunction()
        logAppStates(previous: previousAppState, current: "Background")
    }
    
    // MARK: - Moving from the background to the foreground
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        logAppLifeCycleFunction()
        logAppStates(previous: previousAppState, current: "Inactive")
    }
    
    // MARK: - Closing the app
    
    func applicationWillTerminate(_ application: UIApplication) {
        logAppLifeCycleFunction()
        logAppStates(previous: previousAppState, current: "Terminated")
    }
    
    // MARK: - UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: - Private
    
    private func logAppLifeCycleFunction(name: String = #function) {
        if #available(iOS 13.0, *) {} else {
            print("Application lifecycle method: \(name)")
        }
    }
    
    private func logAppStates(previous: String, current: String) {
        if #available(iOS 13.0, *) {} else {
            print("Application moved from \(previous) to \(current)\n")
            previousAppState = current
        }
    }
}

private extension UIApplication.State {
    
    var name: String {
        switch self {
        case .active:
            return "Active"
        case .background:
            return "Background"
        case .inactive:
            return "Inactive"
        @unknown default:
            return "Unknown app state"
        }
    }
}
