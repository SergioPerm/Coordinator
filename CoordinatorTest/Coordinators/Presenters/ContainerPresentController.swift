//
//  PresentContainerViewController.swift
//  CoordinatorTest
//
//  Created by kluv on 28/10/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

class ContainerPresenterController: UIViewController, PresenterController {
    var presentableControllers: [PresentableController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func pop(vc: PresentableController) {
        
    }
    
    func push(vc: PresentableController) {
        presentableControllers.append(vc)
        
        switch vc.presentableControllerViewType {
        case .menuViewController:
            add(vc, atIndex: 0)
        case .modalViewController:
            add(vc, withDimmedBack: true)
        case .navigationStackController:
            let presentableControllerNavBar = presentableControllers.compactMap {
                $0.getNavigationController()
            }.last
                       
            if let presentableControllerNavBar = presentableControllerNavBar {
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
