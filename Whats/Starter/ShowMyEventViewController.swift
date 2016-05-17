//
//  ShowMyEventViewController.swift
//  Whats
//
//  Created by Martreux Steven on 16/05/2016.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit

class ShowMyEventViewController: UIViewController {

    @IBOutlet var _tableView: UITableView!
    var _events : [EventData] = []
    var _indexSelect : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._events = EventData.findAll()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        if (self._events.count == 0) {
            self._tableView.hidden = true
        }
        self._tableView.delegate = self
        self._tableView.dataSource = self
    }
}


extension ShowMyEventViewController : UITableViewDataSource, UITableViewDelegate
{
    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellMyEvent", forIndexPath: indexPath) as! eventCell
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: eventCell, forRowAtIndexPath: NSIndexPath) {
        cell.selectionStyle = .None
        cell.action.text = self._events[forRowAtIndexPath.row].action
        cell._emoticone.text = self._events[forRowAtIndexPath.row].emoticone
        cell._space.text = ""
        cell._space.backgroundColor = COLOR_MAIN
        cell.adress.text = self._events[forRowAtIndexPath.row].adress
    }
    
    
    //MARK: UITableViewDelegate
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self._indexSelect = indexPath.row
        self.performSegueWithIdentifier("segueSendEventAgain", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueSendEventAgain" {
            let vc : SendAgainEventViewController = segue.destinationViewController as! SendAgainEventViewController
            vc._event = self._events[self._indexSelect]
        }
    }
    
}

class eventCell: UITableViewCell {
    @IBOutlet var _emoticone: UILabel!
    @IBOutlet var action: UILabel!
    @IBOutlet var _space: UILabel!
    @IBOutlet var adress: UILabel!
    
    
}