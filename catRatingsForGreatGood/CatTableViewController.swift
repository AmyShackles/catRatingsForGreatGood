//
//  CatTableViewController.swift
//  catRatingsForGreatGood
//
//  Created by Amy Shackles on 2/22/20.
//  Copyright © 2020 Amy Shackles. All rights reserved.
//

import UIKit
import os.log

class CatTableViewController: UITableViewController {
    
    //MARK: Properties
    var cats = [Cat]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        
        // Load any saved cats, otherwise load sample data
        if let savedCats = loadCats() {
            cats += savedCats
        } else {
            // Load the sample data
            loadSampleCats()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a call identifier
        // as? CatTableVIewCell downcasts UITableViewCell class to CatTableViewCell class
        // guard let expression safely unwraps the optional
        // The downcast shouldn't fail, but if it does, throw a fatal error
        let cellIdentifier = "CatTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CatTableViewCell else {
            fatalError("The dequeued cell is not an instance of CatTableViewCell")
        }
        
        // Fetches the appropriate cat for the data source layout
        let cat = cats[indexPath.row]

        cell.nameLabel.text = cat.name
        cell.photoImageView.image = cat.photo
        cell.ratingControl.rating = cat.rating

        return cell
    }


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            cats.remove(at: indexPath.row)
            saveCats()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            case "AddItem":
                os_log("Adding a new cat", log: OSLog.default, type: .debug)
                
            case "ShowDetail":
                guard let catDetailViewController = segue.destination as? CatViewController else {
                    fatalError("Unexpected destination: \(segue.destination)")
            }
                guard let selectedCatCell = sender as? CatTableViewCell else {
                    fatalError("Unexpected sender: \(sender)")
            }
                guard let indexPath = tableView.indexPath(for: selectedCatCell) else {
                    fatalError("The selected cell is not being displayed by the table")
            }
                let selectedCat = cats[indexPath.row]
                catDetailViewController.cat = selectedCat
            
            default:
                fatalError("Unexpected Segue Identifier: \(segue.identifier)")
        }
    }
    
    // MARK: Actions
    @IBAction func unwindToCatList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? CatViewController, let cat = sourceViewController.cat {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing cat
                cats[selectedIndexPath.row] = cat
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // Add a new cat
                let newIndexPath = IndexPath(row: cats.count, section:0)
                cats.append(cat)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            // Save the cats
            saveCats()
        }
    }
    //MARK: Private Methods
     
    private func loadSampleCats() {
        let photo1 = UIImage(named: "cat1")
        let photo2 = UIImage(named: "cat2")
        let photo3 = UIImage(named: "cat3")
        let photo4 = UIImage(named: "cat4")
        let photo5 = UIImage(named: "cat5")
        let photo6 = UIImage(named: "cat6")
        let photo7 = UIImage(named: "cat7")
        let photo8 = UIImage(named: "cat8")
        let photo9 = UIImage(named: "cat9")
        let photo10 = UIImage(named: "cat10")
        let photo11 = UIImage(named: "cat11")
        let photo12 = UIImage(named: "cat12")
        let photo13 = UIImage(named: "cat13")
        let photo14 = UIImage(named: "cat14")
        let photo15 = UIImage(named: "cat15")
        
        guard let cat1 = Cat(name: "Bob and Tom", photo: photo1, rating: 5) else {
            fatalError("Unable to instantiate catl1")
        }
        
        guard let cat2 = Cat(name: "Tom", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate cat2")
        }
        
        guard let cat3 = Cat(name: "Bob and Tom", photo: photo3, rating: 5) else {
            fatalError("Unable to instantiate cat3")
        }
        guard let cat4 = Cat(name: "Bob and Tom", photo: photo4, rating: 5) else {
            fatalError("Unable to instantiate catl4")
        }
        
        guard let cat5 = Cat(name: "Bob and Tom", photo: photo5, rating: 5) else {
            fatalError("Unable to instantiate cat5")
        }
        
        guard let cat6 = Cat(name: "Bob and Tom", photo: photo6, rating: 5) else {
            fatalError("Unable to instantiate cat6")
        }
        guard let cat7 = Cat(name: "Bob", photo: photo7, rating: 5) else {
            fatalError("Unable to instantiate catl7")
        }
        
        guard let cat8 = Cat(name: "Tom", photo: photo8, rating: 5) else {
            fatalError("Unable to instantiate cat8")
        }
        
        guard let cat9 = Cat(name: "Tom", photo: photo9, rating: 5) else {
            fatalError("Unable to instantiate cat9")
        }
        guard let cat10 = Cat(name: "Tom", photo: photo10, rating: 5) else {
            fatalError("Unable to instantiate catl10")
        }
        
        guard let cat11 = Cat(name: "Bob", photo: photo11, rating: 5) else {
            fatalError("Unable to instantiate cat11")
        }
        
        guard let cat12 = Cat(name: "Tom", photo: photo12, rating: 5) else {
            fatalError("Unable to instantiate cat12")
        }
        guard let cat13 = Cat(name: "Bob", photo: photo13, rating: 5) else {
            fatalError("Unable to instantiate catl13")
        }
        
        guard let cat14 = Cat(name: "Tom", photo: photo14, rating: 5) else {
            fatalError("Unable to instantiate cat14")
        }
        
        guard let cat15 = Cat(name: "Bob", photo: photo15, rating: 5) else {
            fatalError("Unable to instantiate cat15")
        }
        
        cats += [cat1, cat2, cat3, cat4, cat5, cat6, cat7, cat8, cat9, cat10, cat11, cat12, cat13, cat14, cat15]
    }
    private func saveCats() {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: cats, requiringSecureCoding: false)
            try data.write(to: Cat.ArchiveURL)
        } catch {
            os_log("Could not save cats", log: OSLog.default, type: .debug)
        }
    }
    
    private func loadCats() -> [Cat]? {
        if let savedCats = NSData(contentsOf: Cat.ArchiveURL) {
            do {
                let data = Data(referencing:savedCats)
                
                if let loadedCats = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Cat> {
                    return loadedCats
                }
            } catch {
                os_log("Could not load cats", log: OSLog.default, type: .error)
                return nil
            }
        }
        return nil
    }

}
