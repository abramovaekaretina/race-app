//
//  UIView+Shadow.swift
//  race
//
//  Created by Ekaterina Abramova on 09.10.2020.
//  Copyright © 2020 Ekaterina Abramova. All rights reserved.
//

import UIKit

extension UIView {
    func setShadow(color: CGColor = UIColor.black.cgColor,
                   offset: CGSize = CGSize(width: -5, height: -5),
                   opacity: Float = 0.5,
                   radius: CGFloat = 5) {
        self.layer.shadowColor = color
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
}
