//
//  PresentableController.swift
//  CoordinatorTest
//
//  Created by kluv on 29/10/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

enum PresentableControllerViewType {
    case menuViewController
    case modalViewController
    case navigationStackController
}

protocol PresentableController: UIViewController {
    var presentableControllerViewType: PresentableControllerViewType { get set }
    var presenter: PresenterController { get set }
}

extension PresentableController where Self: UIViewController {
    func getNavigationController() -> UINavigationController? {
        return navigationController ?? nil
    }
}

