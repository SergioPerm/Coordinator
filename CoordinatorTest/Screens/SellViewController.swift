//
//  SellViewController.swift
//  CoordinatorTest
//
//  Created by kluv on 28/10/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

class SellViewController: UIViewController, PresentableController {
    var presentableControllerViewType: PresentableControllerViewType
    var presenter: PresenterController?
    
    weak var coordinator: MainCoordinator?
    
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

        view.frame = CGRect(origin: CGPoint(x: 20, y: 20), size: CGSize(width: view.frame.width - 40, height: view.frame.height - 40))
        view.frame.origin = CGPoint(x: view.frame.origin.x, y: view.frame.maxY)
        view.backgroundColor = .white
        
        let title = UILabel()
        title.text = "SELL"
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
            self.view.frame.origin = CGPoint(x: 20, y: 20)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    @objc private func closeAction(sender: UIButton) {
        presenter?.pop(vc: self)
    }
    
}
