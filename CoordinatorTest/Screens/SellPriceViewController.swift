//
//  SellPriceViewController.swift
//  CoordinatorTest
//
//  Created by kluv on 05/11/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

class SellPriceViewController: UIViewController, PresentableController {
    var presentableControllerViewType: PresentableControllerViewType
    var presenter: PresenterController?
    
    init(presenter: PresenterController?, presentableControllerViewType: PresentableControllerViewType) {
        self.presenter = presenter
        self.presentableControllerViewType = presentableControllerViewType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.frame = CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: view.frame.width - 100, height: view.frame.height - 100))
        view.frame.origin = CGPoint(x: view.frame.origin.x, y: view.frame.maxY)
        view.backgroundColor = .yellow
        
        let title = UILabel()
        title.text = "SELL PRICE"
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(title)
        
        let closeBtn = UIButton(type: .close)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.addTarget(self, action: #selector(closeAction(sender:)), for: .touchUpInside)
        
        view.addSubview(closeBtn)
        
        let constraints: [NSLayoutConstraint] = [
            title.widthAnchor.constraint(equalToConstant: 60),
            title.heightAnchor.constraint(equalToConstant: 30),
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            closeBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            closeBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            closeBtn.widthAnchor.constraint(equalToConstant: 30),
            closeBtn.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin = CGPoint(x: 50, y: 50)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    @objc private func closeAction(sender: UIButton) {
        presenter?.pop(vc: self)
    }
    
    deinit {
        print("deinit sellprice vc")
    }
}
