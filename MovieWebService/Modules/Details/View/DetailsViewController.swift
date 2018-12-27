//
//  DetailsViewController.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var eventHandler: DetailsModuleInput!
    
    private let directorName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "Director Name"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let directorNameValue: UILabel = {
        let label = UILabel()
        label.text = "director value"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tapToShowMore: TappableLabel = {
        let label = TappableLabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "Tap here to show more"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let actorName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "Actor Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let actorNameValue: UILabel = {
        let label = UILabel()
        label.text = "actor value"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let actorScreenName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.text = "Actor Screen Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let actorScreenNameValue: UILabel = {
        let label = UILabel()
        label.text = "screen value"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 16.0
        stackView.distribution = .fill
        return stackView
    }()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventHandler.viewIsReady()
    }
    
    // MARK: UI configuration
    
    private func setup() {
        setupViews()
        addSubviews()
        setupConstraints()
    }
    
    private func setupViews() {
        view = UIView()
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        view.addSubview(stackView)
        
        [directorName, directorNameValue,
         tapToShowMore,
         actorName, actorNameValue,
         actorScreenName, actorScreenNameValue]
            .forEach(stackView.addArrangedSubview)
    }
    
    private func setupConstraints() {
        if #available(iOS 11.0, *) {
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0).isActive = true
        } else {
            let topheight = navigationController?.navigationBar.frame.height ?? 44 + 20 + 32.0
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: topheight).isActive = true
        }
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16.0).isActive = true
    }
    
    deinit {
        print("\(self)")
    }
}

extension DetailsViewController: DetailsViewInput {
    func showExpandedDetail(with detailViewModel: ExpandedDetailViewModel) {
        tapToShowMore.isHidden = true
        [actorName, actorNameValue,
         actorScreenName, actorScreenNameValue]
            .forEach({ $0.isHidden = false })
        
        actorNameValue.text = detailViewModel.actorName
        actorScreenNameValue.text = detailViewModel.actorScreenName
    }
    
    func showCollapsedDetail(with detailViewModel: CollapsedDetailViewModel) {
        tapToShowMore.isHidden = false
        //hide actorName , actorScreenName
        [actorName, actorNameValue,
         actorScreenName, actorScreenNameValue]
            .forEach({ $0.isHidden = true })
        
        directorNameValue.text = detailViewModel.directorName
    }
    
    func setupInitialState() {
        setup()
        tapToShowMore.delegate = self
    }
}

extension DetailsViewController: TappableLabelDelegate {
    func didReceiveTouch() {
        eventHandler.showMoreDetails()
    }
}


