//
//  Coordinator.swift
//  CoordinatorAdvance
//
//  Created by nguyentienhoang on 2019/05/07.
//  Copyright © 2019 nguyentienhoang. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject { //AnyObject: because conformed protocol is class
    var childCoordinators: [Coordinator] { get set }
    var navigator: UINavigationController { get set }
    func start()
}
