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
    var interactor: MockInteractor!
    var view: MockView!
	
    override func setUp() {
        super.setUp()
        let film = Film()
        film.director = Director()
        film.director.name = "name"
        
        interactor = MockInteractor(film: film)
        view = MockView()
       
        presenter = DetailsPresenter(view: view, router:MockDetailsRouterInput())
        presenter.interactor = interactor
    }

    override func tearDown() {
        interactor = nil
        view = nil
        presenter = nil

        super.tearDown()
    }
    
    func testHandleViewIsReadyEvents() {
        //given
        //let mock = MockOutput()
        
        //when
        presenter.viewIsReady()
        
        //then
        XCTAssertTrue(view.isSetupInitialStateCalled)
        XCTAssertTrue(view.isShowCollapsedDetail)
    }

    // MARK: - Mock

    struct MockDetailsRouterInput: DetailsRouterInput {
        
    }
    
    struct MockInteractor: DetailsInteractorInput {
        var film: Film
        

    }

    class MockView: DetailsViewInput {
        var isSetupInitialStateCalled = false
        var isShowCollapsedDetail = false
        var isShowExpandedDetail = false
        
        func setupInitialState() {
            isSetupInitialStateCalled = true
        }
        
        func showCollapsedDetail(with detailViewModel: CollapsedDetailViewModel) {
            isShowCollapsedDetail = true
        }
        
        func showExpandedDetail(with detailViewModel: ExpandedDetailViewModel) {
            isShowExpandedDetail = true
        }
    }

}
