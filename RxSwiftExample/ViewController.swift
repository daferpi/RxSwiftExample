//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by daferpi on 30/10/16.
//  Copyright © 2016 daferpi. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var showCities = [String]()
    let allCities = ["New York", "London", "Oslo", "Warsaw", "Berlin", "Praga", "Madrid", "Barcelona", "Santiago" ]
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.tableView.delegate = self
        
        
        
        let searchableText = searchBar
                            .rx
                            .text
        
        searchableText.subscribe(onNext: { n in
            print("\(n)")
        }).addDisposableTo(disposeBag)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        cell.textLabel?.text = showCities[indexPath.row]
        
        return cell
    }

}

