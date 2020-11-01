//
//  PresentContainerViewController.swift
//  CoordinatorTest
//
//  Created by kluv on 28/10/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

class ContainerPresenterController: UIViewController, PresenterController {
    var presentableControllers: [PresentableController?] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func pop(vc: PresentableController) {
        presentableControllers = presentableControllers.filter { $0! != vc as UIViewController }
        
        switch vc.presentableControllerViewType {
        case .menuViewController:
            vc.remove(withDimmedBack: false)
        case .modalViewController:
            vc.remove(withDimmedBack: true)
        case .navigationStackController:
            if let presentableControllerNavBar = getNavigationController(from: vc) {
                presentableControllerNavBar.popViewController(animated: true)
            }
        }
    }
    
    func push(vc: PresentableController) {
                
        presentableControllers = presentableControllers.filter { $0 != nil }
        
        presentableControllers.append(vc)
        
        switch vc.presentableControllerViewType {
        case .menuViewController:
            add(vc, atIndex: 0)
        case .modalViewController:
            add(vc, withDimmedBack: true)
        case .navigationStackController:
            if let presentableControllerNavBar = getNavigationController(from: vc) {
                presentableControllerNavBar.pushViewController(vc, animated: true)
                add(presentableControllerNavBar)
            } else {
                //Instantiate first navigation controller
                let navigationController = UINavigationController(rootViewController: vc)
                add(navigationController)
            }
        }
    }
}

extension ContainerPresenterController {
    private func getNavigationController(from vc: PresentableController) -> UINavigationController? {
        return presentableControllers.compactMap {
            $0?.getNavigationController()
        }.last
    }
}
