//
//  MainCoordinator.swift
//  CoordinatorAdvance
//
//  Created by nguyentienhoang on 2019/05/07.
//  Copyright © 2019 nguyentienhoang. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigator: UINavigationController

    init(navigator: UINavigationController) {
        self.navigator = navigator
    }

    func start() {
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
