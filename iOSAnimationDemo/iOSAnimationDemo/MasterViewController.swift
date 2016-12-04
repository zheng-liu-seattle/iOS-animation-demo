//
//  MasterViewController.swift
//  iOSAnimationDemo
//
//  Created by Zheng Liu on 12/3/16.
//  Copyright © 2016 Zheng Liu. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    typealias ControllerInfo = (name: String, controller: (Void) -> UIViewController)

    let infos: [ControllerInfo] = [
        ("Rounded Corners", { return RoundedCornersViewController() } ),
        ("path Animation", { return PathViewController() }),
        ("lineWidth Animation", { return LineWidthViewController() }),
        ("Draw rectangle", { return DrawRectangleViewController() })
    ]


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
        cell.textLabel!.text = infos[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present(infos[indexPath.row].controller(), animated: true, completion: nil)
    }

}

