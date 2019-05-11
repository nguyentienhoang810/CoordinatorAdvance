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
    private let detailBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainTitle)
        mainTitle.center = view.center
        mainTitle.sizeToFit()
        mainTitle.text = "Buy"
        mainTitle.textColor = .black

        view.addSubview(detailBtn)
        detailBtn.backgroundColor = .black
        detailBtn.setTitle("Detail", for: .normal)
        detailBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailBtn.heightAnchor.constraint(equalToConstant: 40),
            detailBtn.widthAnchor.constraint(equalToConstant: 200),
            detailBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        detailBtn.addTarget(self, action: #selector(gotoDetail), for: .touchUpInside)
    }

    @objc func gotoDetail() {
        coordinator?.gotoDetail()
    }
}

