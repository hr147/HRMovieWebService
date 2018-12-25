//
//  DetailsModuleBuilder.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import UIKit

@objc class DetailsModuleBuilder: NSObject {
    
    @objc func build(with film: Film) -> UIViewController {
        
        let viewController = DetailsViewController()
        
        let router = DetailsRouter(viewController: viewController)
        
        let presenter = DetailsPresenter(view: viewController, router: router)
        
        let interactor = DetailsInteractor(film: film, output: presenter)
        
        presenter.interactor = interactor
        viewController.eventHandler = presenter
        
        return viewController
    }
    
}
