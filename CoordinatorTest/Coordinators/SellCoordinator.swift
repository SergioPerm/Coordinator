//
//  SellCoordinator.swift
//  CoordinatorTest
//
//  Created by kluv on 05/11/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

class SellCoordinator: NSObject, Coordinator, SelectSellPriceInput {
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var presenter: PresenterController?
            
    init(presenter: PresenterController?) {
        self.presenter = presenter
    }
    
    func start() {
        let vc = SellViewController(presenter: presenter, presentableControllerViewType: .modalViewController)
        vc.coordinator = self
        presenter?.push(vc: vc, completion: { [weak self] in
            self?.parentCoordinator?.childDidFinish(self)
        })
    }
    
    func selecteSellPrice() {
        let vc = SellPriceViewController(presenter: presenter, presentableControllerViewType: .modalViewController)
        presenter?.push(vc: vc, completion: nil)
    }
    
    deinit {
        print("sell coordinator dealocated!")
    }
}
