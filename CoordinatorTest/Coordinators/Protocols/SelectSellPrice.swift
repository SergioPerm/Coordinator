//
//  SelectSellPrice.swift
//  CoordinatorTest
//
//  Created by kluv on 05/11/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

protocol SelectSellPriceInput: Coordinator {
    func selecteSellPrice()
}

protocol SelectSellPriceOutput: UIViewController {
    var coordinator: SelectSellPriceInput? { get set }
}
