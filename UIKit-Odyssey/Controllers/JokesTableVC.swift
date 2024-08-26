//
//  ViewController.swift
//  UIKit-Odyssey
//
//  Created by Jaimin Raval on 05/08/24.
//

import UIKit

class JokesTableVC: UIViewController {

    @IBOutlet weak var jokeTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }

    
    func setupTable(){
        jokeTable.register(UINib(nibName: "JokeCell", bundle: nil), forCellReuseIdentifier: "JokeCell")
        jokeTable.dataSource = self
        jokeTable.delegate = self
    }

}


//  MARK: - tableview methods
extension JokesTableVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath) as! JokeCell
        cell.jokeLabel.text = "hahaha Lol!"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
