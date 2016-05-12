//
//  ListContactViewController.swift
//  Whats
//
//  Created by Martreux Steven on 11/05/2016.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit

class ListContactViewController: UIViewController {

    @IBOutlet var _sendBtn: UIButton!
    @IBOutlet var _searchBar: UISearchBar!
    @IBOutlet var _tableView: UITableView!
    var _event : Event! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Select friends"
        self._tableView.delegate = self
        self._tableView.dataSource = self
    }
    
    @IBAction func _sendAction(sender: UIButton) {
    }
}

extension ListContactViewController : UITableViewDelegate, UITableViewDataSource {
    
    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellContact", forIndexPath: indexPath) as! cellContact
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: cellContact, forRowAtIndexPath: NSIndexPath) {
        cell._nameContact.text = "MAMAN"
        cell._viewSelectedContact.layer.borderWidth = 1.0
        cell._viewSelectedContact.layer.borderColor = self._event._color.CGColor
        cell._viewSelectedContact.layer.cornerRadius = cell._viewSelectedContact.frame.width / 2
        cell._viewSelectedContact.layer.masksToBounds = true
    }
    
    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

class cellContact: UITableViewCell {
    @IBOutlet var _contactImg: UIImageView!
    @IBOutlet var _nameContact: UILabel!
    @IBOutlet var _viewSelectedContact: UIView!
}

