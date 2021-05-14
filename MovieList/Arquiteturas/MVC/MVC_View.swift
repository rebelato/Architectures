//
//  MVC_View.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import UIKit

internal class MVC_View: UIView {

    internal let listView: ListView

    internal override init(frame: CGRect) {
        listView = ListView(frame: frame)
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    internal required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func updateView() {
        listView.updateView()
    }

}

extension MVC_View: ViewCodable {
    
    internal func buildHierarchy() {
        addView(listView)
    }

    internal func buildConstraints() {
        listView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        listView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        listView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        listView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    internal func render() {}
    
}
