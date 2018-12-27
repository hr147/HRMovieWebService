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
    let detailView = DetailsView()
    
    // MARK: Life cycle
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventHandler.viewIsReady()
    }
}

extension DetailsViewController: DetailsViewInput {
    func showExpandedDetail(with detailViewModel: ExpandedDetailViewModel) {
        detailView.tapToShowMore.isHidden = true
        [detailView.actorName, detailView.actorNameValue,
         detailView.actorScreenName, detailView.actorScreenNameValue]
            .forEach({ $0.isHidden = false })
        
        detailView.actorNameValue.text = detailViewModel.actorName
        detailView.actorScreenNameValue.text = detailViewModel.actorScreenName
    }
    
    func showCollapsedDetail(with detailViewModel: CollapsedDetailViewModel) {
        detailView.tapToShowMore.isHidden = false
        //hide actorName , actorScreenName
        [detailView.actorName, detailView.actorNameValue,
         detailView.actorScreenName, detailView.actorScreenNameValue]
            .forEach({ $0.isHidden = true })
        
        detailView.directorNameValue.text = detailViewModel.directorName
    }
    
    func setupInitialState() {
        detailView.tapToShowMore.delegate = self
    }
}

extension DetailsViewController: TappableLabelDelegate {
    func didReceiveTouch() {
        eventHandler.showMoreDetails()
    }
}
