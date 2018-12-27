//
//  DetailsRouter.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

class DetailsRouter: DetailsRouterInput {

	private unowned let viewController: UIViewController
    
    init(viewController: DetailsViewController) {
        self.viewController = viewController
    }
}
