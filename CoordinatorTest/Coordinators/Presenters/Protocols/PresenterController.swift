//
//  PresentController.swift
//  CoordinatorTest
//
//  Created by kluv on 28/10/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

protocol PresenterController: UIViewController {
    var presentableControllers: [PresentableController?] { get set }
    
    func push(vc: PresentableController)
    func pop(vc: PresentableController)
}
