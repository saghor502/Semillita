//
//  PlantaTableViewController.swift
//  Semillita
//
//  Created by Alejandro Mendoza Vargas on 25/09/22.
//

import Foundation
import UIKit

class PlantaTableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    func getLabelsInView(view: UIView) -> [UILabel] {
        var results = [UILabel]()
        for subview in view.subviews as [UIView] {
            if let labelView = subview as? UILabel {
                results += [labelView]
            } else {
                results += getLabelsInView(view: subview)
            }
        }
        return results
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let labels = getLabelsInView(view: table)
        for label in labels {
            print(label.text)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "planta_cell", for: indexPath as IndexPath) as UITableViewCell
        return cell
    }

}
