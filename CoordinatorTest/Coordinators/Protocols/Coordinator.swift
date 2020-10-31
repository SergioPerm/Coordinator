//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by kluv on 28/10/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var presenter: PresenterController { get set }
    
    func start()
}

