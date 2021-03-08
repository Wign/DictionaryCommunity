//
//  ViewController.swift
//  DictionaryCommunity
//
//  Created by Kenneth Andersen on 05/03/2021.
//

import UIKit

class RequestTableViewController: UITableViewController {
    
    //MARK: Properties
    var requests = [Request]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.loadSampledData()
    }

    //MARK: Table setup
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if requests.isEmpty {
            return 1
            
        } else {
            return requests.count
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if requests.isEmpty {
            return 300.0
        } else {
            return 80
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if requests.isEmpty {
            let cellIdentifier = "NoRequestsTableViewCell"
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NoRequestsTableViewCell else {
                fatalError("The dequeued cell is not an instance of NoRequestsTableViewCell.")
            }
            
            return cell
            
        } else {
            let cellIdentifier = "RequestTableViewCell"
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RequestTableViewCell else {
                fatalError("The dequeued cell is not an instance of RequestTableViewCell.")
            }
            
            let request = requests[indexPath.row]
            cell.literalLabel.text = request.literal
            
            return cell
        }
    }
    
    //MARK: Private methods
    private func loadSampledData() {
            guard let request1 = Request(literal: "Ghetto", count: 5, isFavored: false) else {
                fatalError("Unable to instantiate request1")
            }
            
            guard let request2 = Request(literal: "Skyskraber", count: 0, isFavored: false) else {
                fatalError("Unable to instantiate request2")
            }
            
            guard let request3 = Request(literal: "Hjem", count: 1, isFavored: true) else {
                fatalError("Unable to instantiate request3")
            }
            
            requests += [request1, request2, request3]
        }

}

