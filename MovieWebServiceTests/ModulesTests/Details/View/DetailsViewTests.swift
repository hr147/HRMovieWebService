//
//  DetailsViewTests.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import XCTest

@testable
import MovieWebService

class DetailsViewTests: XCTestCase {

    var eventHanlder: MockDetailsModuleInput!
    var viewController: DetailsViewController!
	
    override func setUp() {
        super.setUp()

        eventHanlder = MockDetailsModuleInput()

        viewController = DetailsViewController()
        viewController.eventHandler = eventHanlder
    }

    override func tearDown() {
        eventHanlder = nil
        viewController = nil
		
        super.tearDown()
    }

    func testIfViewIsReady() {
        //given
        //let mock = MockOutput()

        //when
        viewController.viewDidLoad()

        //then
        XCTAssertTrue(eventHanlder.viewIsReadyDidCall)
    }

    // MARK: - Mock

    class MockDetailsModuleInput: DetailsModuleInput {
        func showMoreDetails() {
            
        }
        
        var viewIsReadyDidCall: Bool = false

        func viewIsReady() {
            viewIsReadyDidCall = true
        }
        
    }
}
