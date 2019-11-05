//
//  ViewController.swift
//  WatchMoviesInMVP
//
//  Created by Vaayoo on 17/05/19.
//  Copyright © 2019 Vaayoo. All rights reserved.
//

import UIKit
let cellIdentifier = "reuseIdentifier"
class ViewController: UIViewController, PresenterDelegate {
    @IBOutlet weak var moviesTBL: UITableView!
    fileprivate let presenter = Presenter.init(dataService: DataService())
    fileprivate var entrys: [Entry]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.delegate = self
        presenter.getMovies()
        moviesTBL.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    func setEntrys(entry: [Entry]) {
        entrys = entry
        DispatchQueue.main.async {
            self.moviesTBL.reloadData()
        }
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entrys?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTBL.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as UITableViewCell
        if let entry = entrys?[indexPath.row]{
        cell.textLabel!.text = entry.imName.label
        }
        return cell
    }
}

