//
//  ViewController.swift
//  UIKit-Odyssey
//
//  Created by Jaimin Raval on 05/08/24.
//

import UIKit


class JokesTableVC: UIViewController {

    @IBOutlet weak var jokeTable: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private var jokeArr: [JokeModel] = []
    
//    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    private var activityIndicator: UIActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
//        jokeApi()
        if(jokeArr.isEmpty){
            loadApi(for:segmentedControl.selectedSegmentIndex)
            saveToUsrDefault(usrName: "Jinay")
            printUsrDefault()
        }
//        self.reloadTable()
        
    }
    
    func saveToUsrDefault(usrName:String){
        
        UserDefaults.standard.set(usrName, forKey: "Usr")
    }
    
    func printUsrDefault(){
        let data = UserDefaults.standard.value(forKey: "Usr")
        print("\(data!)")
    }
    @IBAction func handleSegment(_ sender: Any) {
        
        loadApi(for:segmentedControl.selectedSegmentIndex)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
//        loadApi()
    }
    
    func loadApi(for segmentIndex:Int){
        
        activityIndicator.startAnimating()
        self.jokeArr.removeAll()
        let category = segmentedControl.selectedSegmentIndex == 0 ? "general" : "programming"
        ApiManager().fetchAF(category: category, completionHandler: { result in
            
            switch result{
            case.success(let data):
                sleep(3)
                
                self.jokeArr = data
//                self.jokeArr.append(contentsOf: data)
                self.jokeTable.reloadData()

//                self.stopLoadingIndicator()
                self.activityIndicator.stopAnimating()
                
//                self.jokeTable.isHidden=true
            case .failure(let error):
                print("\(error)")
            }
        })
    }
//    func startLoadingIndicator(){
//        DispatchQueue.main.async {
//            self.loadingIndicator.isHidden=false
//            self.loadingIndicator.startAnimating()
//        }
//    }
//    
//    func stopLoadingIndicator(){
//        DispatchQueue.main.async {
//            self.loadingIndicator.isHidden=true
//            self.loadingIndicator.stopAnimating()
//        }
//    }
    
    func reloadTable(){
        DispatchQueue.main.async{
            self.jokeTable.reloadData()
        }
    }
    func setupTable(){
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        jokeTable.register(UINib(nibName: "JokeCell", bundle: nil), forCellReuseIdentifier: "JokeCell")
        jokeTable.dataSource = self
        jokeTable.delegate = self
    }

}

//  MARK: - tableview methods
extension JokesTableVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
        return jokeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath) as! JokeCell
        cell.jokeLabel.text=jokeArr[indexPath.row].type
        cell.jokeSetup.text=jokeArr[indexPath.row].setup
        cell.punchLine.text=jokeArr[indexPath.row].punchline
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "NavigateToDetail", sender: jokeArr[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, sourceView, completionHandler in
            self.jokeArr.remove(at: indexPath.row)
            self.reloadTable()
            
        }
        let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction])
        swipeConfig.performsFirstActionWithFullSwipe = false
        return swipeConfig;
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let details = segue.destination as? DataFetched, let joke = sender as? JokeModel {
                details.jokeID = joke.id
                details.jokeType = joke.type
                details.jokeSetup = joke.setup
                details.jokePunchline = joke.punchline
        }
    }
    
    
}
