//
//  BuyViewController.swift
//  CoordinatorTest
//
//  Created by kluv on 28/10/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, PresentableController {
    var presentableControllerViewType: PresentableControllerViewType
    var presenter: PresenterController?
    
    weak var coordinator: BuyCoordinator?
    var productType: Int = 0
    
    init(presenter: PresenterController?, presentableControllerViewType: PresentableControllerViewType) {
        self.presentableControllerViewType = presentableControllerViewType
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let title = UILabel()
        title.text = "BUY \(productType)"
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(title)
        
        let closeBtn = UIButton(type: .close)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.addTarget(self, action: #selector(closeAction(sender:)), for: .touchUpInside)
        
        let constraints: [NSLayoutConstraint] = [
            title.widthAnchor.constraint(equalToConstant: 60),
            title.heightAnchor.constraint(equalToConstant: 30),
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    deinit {
        print("deinit buy vc")
    }
    
    @objc private func closeAction(sender: UIButton) {
        
    }
    
}
