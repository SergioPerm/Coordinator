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
    var presenter: PresenterController
    
    init(presenter: PresenterController) {
        self.presenter = presenter
    }
    
    func start() {
        let vc = ViewController(presenter: presenter, presentableControllerViewType: .navigationStackController, withSlideMenu: true)
        vc.coordinator = self
        presenter.push(vc: vc)
    }
        
    func buy(to productType: Int) {
        let child = BuyCoordinator(presenter: presenter, with: productType)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func sell() {
        let vc = SellViewController()
        vc.coordinator = self
        //navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        guard let child = child else { return }
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) { return }
        
        if let buyViewController = fromViewController as? BuyViewController {
            childDidFinish(buyViewController.coordinator)
        }
    }
    
}
