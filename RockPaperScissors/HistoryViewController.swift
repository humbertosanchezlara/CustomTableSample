//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Humberto Sanchez Lara on 7/11/17.
//  Copyright © 2017 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit
import Foundation


class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   
    var history = [RPSMatch]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
// REGULAR WAY FOR CELLS NOT BEING CUSTOM
//        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCellIdentifier")!
        
// CUSTOM CELL: create a customeCell class and make sure the cell uses that class
        let cell:CustomCell = tableView.dequeueReusableCell(withIdentifier: "historyCellIdentifier") as! CustomCell
        let match = history[(indexPath as NSIndexPath).row]

// REGULAR WAY FOR CELLS NOT BEING CUSTOM
//        cell.textLabel?.text = victoryDescription(match: match)
//        cell.detailTextLabel?.text = "\(match.p1) vs \(match.p2)"
        
        cell.resultLabel.text = victoryDescription(match: match)
        cell.objectsLabel.text = "\(match.p1) vs \(match.p2)"
        
        return cell
        
    }
    
    func victoryDescription(match: RPSMatch) -> String {
        
        if (match.p1 == match.p2) {
            return "tie"
        } else if (match.p1.defeats(match.p2)) {
            return "Win!"
            
        } else {
            return "Lose!"
        }
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
