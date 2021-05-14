//
//  ViewCodable.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 09/07/20.
//  Copyright © 2020 Lucas Rebelato. All rights reserved.
//

import UIKit

protocol ViewCodable where Self: UIView {
    func setupView()
    func buildHierarchy()
    func buildConstraints()
    func configure()
    func render()
}

extension ViewCodable {

    func setupView() {
        configure()
        buildHierarchy()
        buildConstraints()
        render()
    }

    func configure() { }

}
