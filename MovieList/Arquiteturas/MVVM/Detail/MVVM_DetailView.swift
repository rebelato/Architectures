//
//  MVVM_DetailView.swift
//  MovieList
//
//  Created by lucas.r.rebelato on 14/05/21.
//

import UIKit

internal class MVVM_DetailView: UIView {
    
    internal var viewModel: MVVM_DetailViewModelProtocol? {
        didSet {
            updateView()
        }
    }

    internal let titleLabel: UILabel
    internal let overviewLabel: UILabel

    internal override init(frame: CGRect) {
        titleLabel = UILabel()
        overviewLabel = UILabel()
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    internal required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateView() {
        titleLabel.text = viewModel?.title
        overviewLabel.text = viewModel?.overview
    }

}

extension MVVM_DetailView: ViewCodable {
    
    internal func buildHierarchy() {
        addView(titleLabel, overviewLabel)
    }

    internal func buildConstraints() {
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        
        overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24).isActive = true
        overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
    }

    internal func render() {
        backgroundColor = .white
        
        titleLabel.textColor = .black
        
        overviewLabel.textColor = .black
        overviewLabel.numberOfLines = 0
        overviewLabel.textAlignment = .center
    }
    
}
