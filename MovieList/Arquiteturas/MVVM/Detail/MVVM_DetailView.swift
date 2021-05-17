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
    internal let posterView: UIImageView

    internal override init(frame: CGRect) {
        titleLabel = UILabel()
        overviewLabel = UILabel()
        posterView = UIImageView()
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
        posterView.image = viewModel?.poster
    }

}

extension MVVM_DetailView: ViewCodable {
    
    internal func buildHierarchy() {
        addView(posterView, titleLabel, overviewLabel)
    }

    internal func buildConstraints() {
        posterView.topAnchor.constraint(equalTo: topAnchor, constant: 90).isActive = true
        posterView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        posterView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        posterView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: posterView.bottomAnchor, constant: 24).isActive = true
        
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
