//
//  MainCoordinator.swift
//  CoordinatorTest
//
//  Created by kluv on 28/10/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Buying, Selling, Coordinator, UINavigationControllerDelegate {
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var presenter: PresenterController?
    
    init(presenter: PresenterController) {
        self.presenter = presenter
    }
    
    func start() {
        let vc = ViewController(presenter: presenter, presentableControllerViewType: .navigationStackController, withSlideMenu: true)
        vc.coordinator = self
        presenter?.push(vc: vc, completion: nil)
    }
            
    func buy(to productType: Int) {
        let child = BuyCoordinator(presenter: presenter, with: productType)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func sell() {
        let child = SellCoordinator(presenter: presenter)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}
