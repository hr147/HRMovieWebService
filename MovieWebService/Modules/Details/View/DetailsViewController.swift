//
//  DetailsViewController.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, DetailsViewInput, TappableLabelDelegate {

    var output: DetailsViewOutput!
    public var director: Director!

    var directorName: UILabel!
    var directorNameValue: UILabel!
    var tapToShowMore: TappableLabel!
    var actorName: UILabel!
    var actorScreenName: UILabel!

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        view = UIView()
        view.backgroundColor = .white

        directorName = UILabel()
        view.addSubview(directorName)
        directorName.frame = CGRect(x: 20, y: 100, width: 200, height: 30)
        directorName.text = "Director Name"

        directorNameValue = UILabel()
        view.addSubview(directorNameValue)
        directorNameValue.frame = CGRect(x: 20, y: 150, width: 200, height: 30)
        directorNameValue.text = director.name;

        tapToShowMore = TappableLabel()
        view.addSubview(tapToShowMore)
        tapToShowMore.frame = CGRect(x: 20, y: 200, width: 200, height: 30)
        tapToShowMore.text = "Tap here to show more"
        tapToShowMore.delegate = self

        actorName = UILabel()
        view.addSubview(actorName)
        actorName.frame = CGRect(x: 20, y: 240, width: 200, height: 30)

        actorScreenName = UILabel()
        view.addSubview(actorScreenName)
        actorScreenName.frame = CGRect(x: 20, y: 270, width: 200, height: 30)
        actorName.isHidden = true
        actorScreenName.isHidden = true

        let actor: Actor = director.film.cast?[0] as! Actor
        actorName.text = director.name;
        actorScreenName.text = actor.screenName;

    }


    // MARK: DetailsViewInput

    func didReceiveTouch() {
        actorName.isHidden = false
        actorScreenName.isHidden = false
    }

}
