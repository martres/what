//
//  GiveActionViewController.swift
//  Whats
//
//  Created by Martreux Steven on 10/05/2016.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit

class GiveActionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var _tableView: UITableView!
    var _theme: Theme! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._tableView.delegate = self
        self._tableView.dataSource = self
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.setImageNavigationBar(self._theme._pictureName)
        self.setColorNavBar(self._theme._color)
        self.setColorSeparator(self._theme._color)
    }
    
    func setImageNavigationBar(name : String)
    {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .ScaleAspectFit
        let image = UIImage(named: name)
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
    func setColorNavBar(color : UIColor) {
        self.navigationController?.navigationBar.barTintColor = color
    }
    
    func setColorSeparator(color : UIColor) {
        self._tableView.separatorColor = color
    }
    
    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._theme._emoji.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellAction", forIndexPath: indexPath) as! cellAction
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: cellAction, forRowAtIndexPath: NSIndexPath) {
        cell._emojiAction.text = self._theme._emoji[forRowAtIndexPath.row]
        cell._titleAction.text = self._theme._description[forRowAtIndexPath.row]
        cell._space.backgroundColor = self._theme._color
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.min

    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    
}

class cellAction : UITableViewCell
{
    @IBOutlet var _titleAction: UILabel!
    @IBOutlet var _emojiAction: UILabel!
    @IBOutlet var _space: UILabel!
}
