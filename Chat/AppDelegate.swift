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
    
    // MARK: - Launching an app into the foreground
    
    // Launch time - First initialization
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        updateAppState(with: application.applicationState.name)
        return true
    }
    
    // Launch time - Final initialization
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        updateAppState(with: application.applicationState.name)
        return true
    }
    
    // Running - Activate the app
    func applicationDidBecomeActive(_ application: UIApplication) {
        updateAppState(with: application.applicationState.name)
    }
    
    // MARK: - Launching an app into the background
    
    // Background - Enter Background
    func applicationDidEnterBackground(_ application: UIApplication) {
        updateAppState(with: application.applicationState.name)
    }
    
    // MARK: - Moving from the foreground to the background
    
    // Foreground - Deactivate the app (ex. switch to a different app / tap Home button)
    func applicationWillResignActive(_ application: UIApplication) {
        updateAppState(with: "Background")
    }
    
    // MARK: - Moving from the background to the foreground
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        updateAppState(with: "Inactive")
    }
    
    // MARK: - Closing the app
    
    func applicationWillTerminate(_ application: UIApplication) {
        updateAppState(with: "Terminated")
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
    
    private func updateAppState(with current: String, funcName: String = #function) {
        if #available(iOS 13.0, *) { return }
        
        ApplicationStateProvider.shared.update(appState: current, funcName: funcName)
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
