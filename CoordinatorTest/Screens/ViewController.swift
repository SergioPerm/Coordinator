//
//  ViewController.swift
//  CoordinatorTest
//
//  Created by kluv on 28/10/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PresentableController {
    var presenter: PresenterController?
    
    var presentableControllerViewType: PresentableControllerViewType
    
    weak var coordinator: (Coordinator & Buying & Selling)?
    
    private var selectedProduct = 0
    private var buyAction: (() -> Void)?
    private var sellAction: (() -> Void)?
    
    private var menuViewController: LeftMenuViewController?
    private var withSlideMenu: Bool
    
    init(presenter: PresenterController?, presentableControllerViewType: PresentableControllerViewType, withSlideMenu: Bool) {
        self.presentableControllerViewType = presentableControllerViewType
        self.presenter = presenter
        self.withSlideMenu = withSlideMenu
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if withSlideMenu {
            self.menuViewController = LeftMenuViewController(presenter: presenter, presentableControllerViewType: .menuViewController)
            self.menuViewController?.delegate = self
            
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(tapMenuAction(sender:)))
        }
        
        setup()
    }
}

extension ViewController: LeftMenuViewControllerDelegate {
    func presentMenu() {
        
    }
    
    func addMenuButton() {
        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(tapMenuAction(sender:)))
    }
    
    func someAction() {
        menuViewController?.toggleMenu()
        coordinator?.buy(to: 77)
    }
}

extension ViewController {
    private func setup() {
        navigationController?.title = "OLOLO"
        
        
        
        view.backgroundColor = UIColor.white
        
        let btnBuy = UIButton()
        btnBuy.setTitle("Buy", for: .normal)
        btnBuy.setTitleColor(.blue, for: .normal)
        btnBuy.layer.borderColor = UIColor.blue.cgColor
        btnBuy.layer.borderWidth = 2
        btnBuy.translatesAutoresizingMaskIntoConstraints = false
        
        let btnSell = UIButton()
        btnSell.setTitle("Sell", for: .normal)
        btnSell.setTitleColor(.blue, for: .normal)
        btnSell.layer.borderColor = UIColor.blue.cgColor
        btnSell.layer.borderWidth = 2
        btnSell.translatesAutoresizingMaskIntoConstraints = false
        
        let selectProductControl = UISegmentedControl(items: ["First", "Second"])
        selectProductControl.translatesAutoresizingMaskIntoConstraints = false
        selectProductControl.selectedSegmentIndex = selectedProduct
        selectProductControl.addTarget(self, action: #selector(selectProduct(sender:)), for: .valueChanged)
        
        view.addSubview(btnBuy)
        view.addSubview(btnSell)
        view.addSubview(selectProductControl)
        
        let constraints: [NSLayoutConstraint] = [
            btnBuy.widthAnchor.constraint(equalToConstant: view.frame.width/5),
            btnBuy.heightAnchor.constraint(equalToConstant: 40),
            btnBuy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnBuy.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            btnSell.widthAnchor.constraint(equalToConstant: view.frame.width/5),
            btnSell.heightAnchor.constraint(equalToConstant: 40),
            btnSell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnSell.topAnchor.constraint(equalTo: btnBuy.bottomAnchor, constant: 20),
            selectProductControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            selectProductControl.topAnchor.constraint(equalTo: btnSell.bottomAnchor, constant: 20)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        btnBuy.addTarget(self, action: #selector(tapBuy(sender:)), for: .touchUpInside)
        btnSell.addTarget(self, action: #selector(tapSell(sender:)), for: .touchUpInside)
    }
    
    @objc private func tapMenuAction(sender: UIBarButtonItem) {
        menuViewController?.presentMenu()
    }
    
    @objc func selectProduct(sender: UISegmentedControl) {
        selectedProduct = sender.selectedSegmentIndex
    }
    
    @objc func tapBuy(sender: UIButton) {
        coordinator?.buy(to: selectedProduct)
    }
    
    @objc func tapSell(sender: UIButton) {
        coordinator?.sell()
    }
}

