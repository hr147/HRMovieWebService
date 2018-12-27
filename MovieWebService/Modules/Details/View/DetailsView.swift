//
//  DetailsView.swift
//  MovieWebService
//
//  Created by Haroon Ur Rasheed on 27/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

import UIKit

class DetailsView: UIView {

    //UI properties
    let directorName: UILabel = .create("Director Name", .titleFont)
    let directorNameValue: UILabel = .create()
    let actorName: UILabel = .create("Actor Name", .titleFont)
    let actorNameValue: UILabel = .create()
    let actorScreenName: UILabel = .create("Actor Screen Name", .titleFont)
    let actorScreenNameValue: UILabel = .create()
    let tapToShowMore: TappableLabel = .create("Tap here to show more", .titleFont)
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 16.0
        stackView.distribution = .fill
        return stackView
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setup() {
        setupViews()
        addSubviews()
        setupConstraints()
    }
    
    private func setupViews() {
        //view = UIView()
        backgroundColor = .white
    }
    
    private func addSubviews() {
        addSubview(stackView)
        
        [directorName, directorNameValue,
         tapToShowMore,
         actorName, actorNameValue,
         actorScreenName, actorScreenNameValue]
            .forEach(stackView.addArrangedSubview)
        
        if #available(iOS 11.0, *) {
            stackView.setCustomSpacing(32, after: directorNameValue)
        }
    }
    
    private func setupConstraints() {
        if #available(iOS 11.0, *) {
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32.0).isActive = true
        }
//        else {
//            let topheight = navigationController?.navigationBar.frame.height ?? 44 + 20 + 32.0
//            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: topheight).isActive = true
//        }
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16.0).isActive = true
    }
}
