//
//  DetailsPresenterTests.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//


import XCTest

@testable
import MovieWebService

class DetailsPresenterTests: XCTestCase {

    var presenter: DetailsPresenter!
    var router: MockRouter!
    var interactor: MockInteractor!
    var view: MockView!
	
    override func setUp() {
        super.setUp()
		
        router = MockRouter()
        interactor = MockInteractor()
        view = MockView()

        presenter = DetailsPresenter()
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
    }

    override func tearDown() {
        router = nil
        interactor = nil
        view = nil
        presenter = nil

        super.tearDown()
    }

    // MARK: - Mock

    class MockInteractor: DetailsInteractorInput {

    }

    class MockRouter: DetailsRouterInput {

    }

    class MockView: DetailsViewInput {
		
    }

}
