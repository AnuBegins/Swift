//
//  ViewController.swift
//  Star_Wars_Encyclopedia
//
//  Created by Arun Ram on 7/16/18.
//  Copyright © 2018 Arun Ram. All rights reserved.
//

import UIKit
import CoreData

class PeopleViewController: UITableViewController {

    var people: [NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(from: "http://swapi.co/api/people")
        print(people)
    }
    
    func getData(from url:String) {
        let url     = URL(string: url)   // specify the url to which we will be sending the GET request
        let session = URLSession.shared  // create a URLSession to handle the request tasks
        
        let task    = session.dataTask(   // create a "data task" to make the request and run completion handler
            with: url!,
            completionHandler: {
                // see: Swift closure expression syntax
                data, response, error in
                // data -> JSON data, response -> headers and other meta-information, error-> if one occurred
                // "do-try-catch" blocks execute a try statement and then use the catch statement for errors
                do {
                    // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                    if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        //print(jsonResult)
                        let results = jsonResult["results"] as! [NSDictionary]
                        self.people.append(contentsOf: results)

//                            for i in 0..<resultsArray.count {
//                                let resultsArray2 = resultsArray[i] as! NSDictionary
//                                //print(resultsArray.firstObject)
//                                //print(resultsArray2["name"])
//                                let name = resultsArray2["name"]
//                                if name != nil {
//                                    self.people.append(name as! String)
//                                    print(name as! String)
//                                }
//                            }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        if let nextURL = jsonResult["next"] as? String {
                            self.getData(from: nextURL)
                        }
                    }
                }
                catch {
                    print(error)
                }
            }
        )
        task.resume()    // execute the task and then wait for the response to run the completion handler. This is async!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // if we return - sections we won't have any sections to put our rows in
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()    // Create a generic cell
        cell.textLabel?.text = (people[indexPath.row]["name"] as! String)  // set the default cell label to the corresponding element in the people array
        return cell   // return the cell so that it can be rendered
    }

}
