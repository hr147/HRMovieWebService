//
//  DetailsInteractor.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

class DetailsInteractor: DetailsInteractorInput {

    private unowned let output: DetailsInteractorOutput
    let film: Film
    
    init(film: Film, output: DetailsInteractorOutput) {
        self.film = film
        self.output = output
    }
}
