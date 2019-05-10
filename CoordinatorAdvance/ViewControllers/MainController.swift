//
//  ViewController.swift
//  CoordinatorAdvance
//
//  Created by nguyentienhoang on 2019/05/07.
//  Copyright © 2019 nguyentienhoang. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    weak var coordinator: MainCoordinator?

    private let buyBtn = UIButton()
    private let createAccountbtn = UIButton()

    @objc func buyTapped() {
        coordinator?.buy()
    }

    @objc func createAccountTapped() {
        coordinator?.createAccount()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        buyBtn.setTitle("go to Buy", for: .normal)
        createAccountbtn.setTitle("go to Create Account", for: .normal)
        buyBtn.addTarget(self, action: #selector(buyTapped), for: .touchUpInside)
        createAccountbtn.addTarget(self, action: #selector(createAccountTapped), for: .touchUpInside)
        buyBtn.backgroundColor = UIColor.orange.withAlphaComponent(0.5)
        createAccountbtn.backgroundColor = UIColor.blue.withAlphaComponent(0.5)

        let stackView = UIStackView(arrangedSubviews: [buyBtn, createAccountbtn])
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.frame = CGRect(x: 0, y: 100, width: 200, height: 100)
        stackView.spacing = 10
    }


}

