//
//  DetailsViewController.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    //event handler property
    var eventHandler: DetailsModuleInput!
    
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

extension UIFont {
    class var titleFont: UIFont {
        return UIFont.systemFont(ofSize: 18, weight: .medium)
    }
    
    class var valueFont: UIFont {
        return UIFont.systemFont(ofSize: 16.0)
    }
}

