//
//  SceneDelegate.swift
//  Chat
//
//  Created by y.o.alekseeva on 06.06.2021.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        updateAppState(with: scene.activationState.name)
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        updateAppState(with: scene.activationState.name)
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        updateAppState(with: "Foreground inactive")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        updateAppState(with: "Foreground inactive")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        updateAppState(with: scene.activationState.name)
    }

    // MARK: - Private
    
    private func updateAppState(with current: String, funcName: String = #function) {
        ApplicationStateProvider.shared.update(appState: current, funcName: funcName)
    }
}

@available(iOS 13.0, *)
private extension UIScene.ActivationState {
    
    var name: String {
        switch self {
        case .unattached:
            return "Unattached"
        case .foregroundActive:
            return "Foreground active"
        case .foregroundInactive:
            return "Foreground inactive"
        case .background:
            return "Background"
        @unknown default:
            return "Unknown state"
        }
    }
}
