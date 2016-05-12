//
//  Theme.swift
//  Whats
//
//  Created by Martreux Steven on 10/05/2016.
//  Copyright © 2016 me. All rights reserved.
//

import Foundation

class Theme {
    
    let _color : UIColor!
    let _emoji : [String]!
    let _description : [String]!
    let _pictureName : String
    
    init(color : UIColor, emoji : [String], description : [String], pictureName : String)
    {
        self._color = color
        self._emoji = emoji
        self._description = description
        self._pictureName = pictureName
    }
}