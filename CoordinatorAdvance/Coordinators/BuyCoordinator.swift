//
//  BuyCoordinator.swift
//  CoordinatorAdvance
//
//  Created by nguyentienhoang on 2019/05/10.
//  Copyright © 2019 nguyentienhoang. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigator: UINavigationController

    init(navigator: UINavigationController) {
        self.navigator = navigator
    }

    func start() {
        let vc = BuyViewController()
        vc.coordinator = self
        navigator.pushViewController(vc, animated: true)
    }

    func gotoDetail() {
        let vc = DetailViewController()
        vc.coordinator = self
        navigator.pushViewController(vc, animated: true)
    }
}
