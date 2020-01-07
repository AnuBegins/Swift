//
//  FilmTabVC.swift
//  Star_Wars_Encyclopedia
//
//  Created by Arun Ram on 7/16/18.
//  Copyright © 2018 Arun Ram. All rights reserved.
//

import UIKit

class FilmTabVC: UITableViewController {
    
    var films       = [String]()
        
    @IBOutlet var filmTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let url     = URL(string: "http://swapi.co/api/films/")
        let session = URLSession.shared
        
        let task    = session.dataTask(with: url!, completionHandler: {
            data, response, error in
            //print("in here")
            // see: Swift nil coalescing operator (double questionmark)
            //print(data ?? "no data") // the "no data" is a default value to use if data is nil
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results              = jsonResult["results"] {
                        let resultsArray        = results as! NSArray

                        for i in 0..<resultsArray.count {
                            let resultsArray2   = resultsArray[i] as! NSDictionary
                            //print(resultsArray.firstObject)
                            //print(resultsArray2["name"])
                            let name            = resultsArray2["title"]
                            if name             != nil {
                                self.films.append(name as! String)
                                print(name as! String)
                            }
                        }
                        DispatchQueue.main.async {
                            self.filmTableView.reloadData()
                        }
                    }
                }
            }
            catch {
                print(error)
            }
        })
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell                = UITableViewCell()
        cell.textLabel?.text    = films[indexPath.row]
        return cell
    }
}
