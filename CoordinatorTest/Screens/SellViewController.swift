//
//  SellViewController.swift
//  CoordinatorTest
//
//  Created by kluv on 28/10/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

class SellViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let title = UILabel()
        title.text = "SELL"
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(title)
        
        let constraints: [NSLayoutConstraint] = [
            title.widthAnchor.constraint(equalToConstant: 60),
            title.heightAnchor.constraint(equalToConstant: 30),
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}
