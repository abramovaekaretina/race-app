//
//  UIView+Gradient.swift
//  race
//
//  Created by Ekaterina Abramova on 09.10.2020.
//  Copyright © 2020 Ekaterina Abramova. All rights reserved.
//

import UIKit

extension UIView {
    func getGradient(colors: [CGColor],
                     startPoint: CGPoint? = nil,
                     endPoint: CGPoint? = nil,
                     type: CAGradientLayerType = .axial) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        if let startPoint = startPoint {
            gradientLayer.startPoint = startPoint
        }
        if let endPoint = endPoint {
            gradientLayer.endPoint = endPoint
        }
        gradientLayer.type = type
        gradientLayer.frame = self.bounds
        self.layer.masksToBounds = true
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
