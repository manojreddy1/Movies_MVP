//
//  Presenter.swift
//  WatchMoviesInMVP
//
//  Created by Vaayoo on 17/05/19.
//  Copyright © 2019 Vaayoo. All rights reserved.
//

import UIKit

protocol PresenterDelegate {
    func setEntrys(entry: [Entry])
}
class Presenter: NSObject {
    
    let dataServices: DataService
    var delegate: PresenterDelegate?
    

    init(dataService: DataService) {
        self.dataServices = dataService
    }
    func getMovies(){
        dataServices.hitService { [weak self](entry: Welcome) in
            self!.delegate?.setEntrys(entry: entry.feed.entry)
        }
    }
    
}
