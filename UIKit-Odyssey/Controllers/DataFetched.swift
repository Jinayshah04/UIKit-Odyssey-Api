//
//  ViewController.swift
//  UIKit-Odyssey
//
//  Created by mobile1 on 04/09/24.
//

import UIKit

class DataFetched: UIViewController {
        var jokeID: Int?
        var jokeType: String?
        var jokeSetup: String?
        var jokePunchline: String?


    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var type: UILabel!
    
    @IBOutlet weak var Steup: UILabel!
    
    @IBOutlet weak var PunchLine: UILabel!
    @IBOutlet weak var valueId: UILabel!
    
    @IBOutlet weak var valueType: UILabel!
  
    @IBOutlet weak var valueSetup: UITextView!
    
    @IBOutlet weak var valuePunchLine: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Steup.lineBreakMode = NSLineBreakMode.byWordWrapping
        Steup.numberOfLines = 0
        PunchLine.lineBreakMode = NSLineBreakMode.byWordWrapping
        PunchLine.numberOfLines = 0
        id.text="id"
        type.text="type"
        Steup.text="Setup"
        PunchLine.text="PunchLine"
        
        valueId.text="\(jokeID!)"
        valueType.text=jokeType
        valueSetup.text=jokeSetup
        valuePunchLine.text=jokePunchline
        // Do any additional setup after loading the view.
    }
    


}
