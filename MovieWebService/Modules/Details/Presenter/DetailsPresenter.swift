//
//  DetailsPresenter.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

struct CollapsedDetailViewModel {
    let directorName: String
}

struct ExpandedDetailViewModel {
    let actorName: String
    let actorScreenName: String
}

class DetailsPresenter: DetailsModuleInput, DetailsInteractorOutput {
    
    private unowned let view: DetailsViewInput
    var interactor: DetailsInteractorInput!
    private let router: DetailsRouterInput
    
    init(view: DetailsViewInput, router: DetailsRouterInput) {
        self.view = view
        self.router = router
    }
    
    // MARK: - DetailsModuleInput
    
    func viewIsReady() {
        view.setupInitialState()
        let film = interactor.film
        view.showCollapsedDetail(with: .init(directorName: film.director.name))
    }
    
    func showMoreDetails() {
        let film = interactor.film
        guard let actor = film.cast.first else { return }
        view.showExpandedDetail(with: .init(actorName: actor.name, actorScreenName: actor.screenName))
    }
    
    // MARK: - DetailsInteractorOutput
    
    
    
}
