//
//  NavigationManager.swift
//  SwiftuiBase
//
//  Created by Vu Vuong on 31/10/2021.
//

import Foundation
import SwiftUI
import  UIKit

// MARK: - Shared value
extension AppNavigator {
    public var navigator: NavigationManager {
        return NavigationManager.shared
    }
}

extension EnvironmentValues {
    public var navigator: NavigationManager {
        return NavigationManager.shared
    }
}

// MARK: - Enum
public enum PopPositionType {
    case first, last
}

// MARK: - Router Manager
public struct NavigationManager {
    fileprivate static let shared = NavigationManager()
    
    private init() {}
    
    public func changeRootView<T: View>(rootView: T) {
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        window?.rootViewController = UIHostingController(rootView: rootView)
    }
    
    public func presentView<T: View>(view: T, transitionStyle: UIModalTransitionStyle? = nil, presentStyle: UIModalPresentationStyle? = nil, animated: Bool? = nil) {
        let nav = NavigationManager.getCurrentNavigationController()
        let controller = UIHostingController(rootView: view)
        controller.modalTransitionStyle = transitionStyle ?? .coverVertical
        controller.modalPresentationStyle = presentStyle ?? .fullScreen
        nav?.present(controller, animated: animated ?? true, completion: nil)
    }
    
    public func pushToView<T: View>(view: T, animated: Bool? = nil) {
        let nav = NavigationManager.getCurrentNavigationController()
        nav?.pushViewController(UIHostingController(rootView: view), animated: animated ?? true)
    }
    
    public func pop(animated: Bool? = nil) {
        let nav = NavigationManager.getCurrentNavigationController()
        nav?.popViewController(animated: animated ?? true)
    }
    
    public func dismiss(animated: Bool? = nil, completion: (() -> Void)? = nil) {
        let nav = NavigationManager.getCurrentNavigationController()
        nav?.dismiss(animated: animated ?? true, completion: completion)
    }
    
    public func popToView<T: View>(_ typeOfView: T.Type, animated: Bool? = nil, inPosition: PopPositionType? = .last) {
        let nav = NavigationManager.getCurrentNavigationController()
        
        switch inPosition {
        case .last:
            if let vc = nav?.viewControllers.last(where: { $0 is UIHostingController<T> }) {
                nav?.popToViewController(vc, animated: animated ?? true)
            }
        case .first:
            if let vc = nav?.viewControllers.first(where: { $0 is UIHostingController<T> }) {
                nav?.popToViewController(vc, animated: animated ?? true)
            }
        default:
            break
        }
    }
    
    public func popToRootView(animated: Bool? = nil) {
        let nav = NavigationManager.getCurrentNavigationController()
        nav?.popToRootViewController(animated: animated ?? true)
    }
    
    private static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
          return nil
        }

        if let navigationController = viewController as? UINavigationController {
          return navigationController
        }

        for childViewController in viewController.children {
          return findNavigationController(viewController: childViewController)
        }

        return nil
    }
    
    private static func getCurrentNavigationController() -> UINavigationController? {
        let nav = findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)
        return nav
    }
}
