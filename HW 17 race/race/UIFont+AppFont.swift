//
//  UIFont+AppFont.swift
//  race
//
//  Created by Ekaterina Abramova on 14.10.2020.
//  Copyright © 2020 Ekaterina Abramova. All rights reserved.
//

import UIKit

extension UIFont {
    static func perfect(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "PerfectDOSVGA437", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
}
