//
//  DetailsRouterTests.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import XCTest

@testable
import MovieWebService

class DetailsRouterTests: XCTestCase {

    var router: DetailsRouter!
    var viewController: MockViewController!

    override func setUp() {
        super.setUp()
		
        viewController = MockViewController()
		
        router = DetailsRouter()
        router.viewController = viewController
    }

    override func tearDown() {
        viewController = nil
        router = nil

        super.tearDown()
    }
	
    // MARK: - Mock
	
    class MockViewController: DetailsViewController {
	
    } 
	
}
