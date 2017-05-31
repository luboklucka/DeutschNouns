//
//  ViewController.swift
//  DeutschNouns
//
//  Created by Lubo Klucka on 12/05/2017.
//  Copyright © 2017 Lubo Klucka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: Constants, variables
    var nounList = [Noun]()
    
    // MARK: IBOutlets
    @IBOutlet weak var nounsTableView: UITableView!

    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nounsTableView.delegate = self
        nounsTableView.dataSource = self
        parseNouns()
    }
    
    // MARK: Parse
    func parseNouns() {
        if let path = Bundle.main.path(forResource: "GermanNouns", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                let lines = data.components(separatedBy: .newlines)
                for line in lines {
                    let lineSplit = line.components(separatedBy: "–")
                    let englishNoun = lineSplit[0]
                    let germanNoun = lineSplit[1]
                    
                    let noun = Noun(english: englishNoun, german: germanNoun)
                    nounList.append(noun)
                    nounsTableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }
    }

    // MARK: TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nounList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nounCell = tableView.dequeueReusableCell(withIdentifier: "nounCell", for: indexPath) as! NounTableViewCell
        nounCell.english.text = nounList[indexPath.row].english
        nounCell.german.text = nounList[indexPath.row].german
        return nounCell
    }
}

