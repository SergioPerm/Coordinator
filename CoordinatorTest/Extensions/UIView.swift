//
//  UIView.swift
//  CoordinatorTest
//
//  Created by kluv on 28/10/2020.
//  Copyright © 2020 itotdel. All rights reserved.
//

import UIKit

extension UIView {
    
    static var dimmedViews = [UIView]()
    
    func showDimmedBelowSubview(subview: UIView, for view: UIView) {
        UIView.dimmedViews.append(UIView())// = UIView()
        
        guard let dimmedView = UIView.dimmedViews.last else { return }
        
        dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        dimmedView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        dimmedView.frame = view.bounds

        view.insertSubview(dimmedView, belowSubview: subview)
    }
    
    func removeDimmedView() {
        if let dimmedView = UIView.dimmedViews.popLast(){
            dimmedView.removeFromSuperview()
        }
    }
}
