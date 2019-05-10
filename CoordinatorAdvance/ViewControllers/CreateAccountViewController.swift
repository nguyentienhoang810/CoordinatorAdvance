//
//  CreateAccountViewController.swift
//  CoordinatorAdvance
//
//  Created by nguyentienhoang on 2019/05/10.
//  Copyright © 2019 nguyentienhoang. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    weak var coordinator: CreateAccountCoordinator?
    
    private let mainTitle = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainTitle)
        mainTitle.center = view.center
        mainTitle.sizeToFit()
        mainTitle.text = "Create Account"
        mainTitle.textColor = .black
    }
}
