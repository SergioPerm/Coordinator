//
//  SelectSellPrice.swift
//  CoordinatorTest
//
//  Created by kluv on 05/11/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

protocol SelectSellPrice: Coordinator {
    func selecteSellPrice()
}

protocol SelectSellPriceCallback: UIViewController {
    var coordinator: SelectSellPrice? { get set }
}
