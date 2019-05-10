//
//  BuyViewController.swift
//  CoordinatorAdvance
//
//  Created by nguyentienhoang on 2019/05/10.
//  Copyright © 2019 nguyentienhoang. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController {
    
    weak var coordinator: BuyCoordinator?

    private let mainTitle = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainTitle)
        mainTitle.center = view.center
        mainTitle.sizeToFit()
        mainTitle.text = "Buy"
        mainTitle.textColor = .black
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishBuying()
    }
}

