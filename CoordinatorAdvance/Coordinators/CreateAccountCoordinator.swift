//
//  CreateAccountCoordinator.swift
//  CoordinatorAdvance
//
//  Created by nguyentienhoang on 2019/05/10.
//  Copyright © 2019 nguyentienhoang. All rights reserved.
//

import UIKit

class CreateAccountCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigator: UINavigationController

    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func start() {
        let vc = CreateAccountViewController()
        vc.coordinator = self
        navigator.pushViewController(vc, animated: true)
    }

    func didFinishCreateAccount() {
        parentCoordinator?.childDidFinish(self)
    }
}

