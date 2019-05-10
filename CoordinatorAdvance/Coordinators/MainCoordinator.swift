//
//  MainCoordinator.swift
//  CoordinatorAdvance
//
//  Created by nguyentienhoang on 2019/05/07.
//  Copyright © 2019 nguyentienhoang. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigator: UINavigationController

    init(navigator: UINavigationController) {
        self.navigator = navigator
    }

    func start() {
        navigator.delegate = self
        let vc = MainController()
        vc.coordinator = self
        navigator.pushViewController(vc, animated: false)
    }

    func buy() {
        let child = BuyCoordinator(navigator: navigator)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }

    func createAccount() {
        let child = CreateAccountCoordinator(navigator: navigator)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
//        guard let toVC = navigationController.transitionCoordinator?.viewController(forKey: .to) else {
//            return
//        }
        //check navigation controller contains VC or not
        if navigationController.viewControllers.contains(fromVC) {
            return
        }

        if let buyViewController = fromVC as? BuyViewController {
            //this mean pop from buy viewController
            //remove index of coordinator
            childDidFinish(buyViewController.coordinator!)
        }

        if let createAccountViewController = fromVC as? CreateAccountViewController {
            childDidFinish(createAccountViewController.coordinator!)
        }
    }

    func childDidFinish(_ child: Coordinator) {
        //mỗi instance của class conform Coordinator sẽ có một địa chỉ trên memory khác nhau.
        //để xoá triệt để -> cần phải xoá luôn cả địa chỉ nhớ.
        //-> cần phải sử dụng operator ===
        //vì protocol là struct nhưng được conform bởi class -> nó cần phải là class
        //-> protocol: AnyObject
        for (index, coordinator) in
            childCoordinators.enumerated() {
                if coordinator === child {//remote triệt để cả địa chỉ nhớ trên memory
                    childCoordinators.remove(at: index)
                    break
                }
        }
    }

}
