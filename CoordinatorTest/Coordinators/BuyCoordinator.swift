//
//  BuyCoordinator.swift
//  CoordinatorTest
//
//  Created by kluv on 28/10/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var childCoordinators = [Coordinator]()
    var presenter: PresenterController?
    
    private var productType: Int
    
    init(presenter: PresenterController?, with productType: Int) {
        self.presenter = presenter
        self.productType = productType
    }
        
    func start() {
        let vc = BuyViewController(presenter: presenter, presentableControllerViewType: .navigationStackController)
        vc.coordinator = self
        vc.productType = productType
        presenter?.push(vc: vc)
    }
}
