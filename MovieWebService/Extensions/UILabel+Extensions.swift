//
//  UILabel+Extensions.swift
//  MovieWebService
//
//  Created by Haroon Ur Rasheed on 27/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

import UIKit

extension UILabel {
    /// Create UILabel for autolayouts
    ///
    /// - Parameters:
    ///   - text: set default text to the label
    ///   - font: set default font to the label
    /// - Returns: it will return new label instance based on given information
    class func create(_ text: String = "", _ font: UIFont = .valueFont) -> Self {
        let label = self.init()
        label.font = font
        label.text = text
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
