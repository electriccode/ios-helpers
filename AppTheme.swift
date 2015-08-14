//
//  AppTheme.swift
//  AdvancedVideoSearch
//
//  Created by Pankaj on 23/07/15.
//  Copyright (c) 2015 Mobilemerit. All rights reserved.
//

import Foundation
import UIKit

let THEME_BG_COLOR = "9AE3B1"
let THEME_FG_COLOR = "494949"
let THEME_ICON_OPACITY = Float(0.7)
let THEME_FONT_PRIMARY = "Avenir-Book"
let THEME_FONT_SECONDARY = "Avenir-Light"
let THEME_FONT = THEME_FONT_PRIMARY

// Color Objects
let UI_BG_COLOR = UIColor.rgba(THEME_BG_COLOR)
let UI_FG_COLOR = UIColor.rgba(THEME_FG_COLOR)

// Font Objects
let UI_FONT_BAR_BUTTON_TEXT = UIFont(name: THEME_FONT_PRIMARY, size: 14.0)
let UI_FONT_TAB_TEXT = UIFont(name: THEME_FONT_PRIMARY, size: 12.0)
let UI_FONT_PAGE_TITLE = UIFont(name: THEME_FONT_PRIMARY, size: 20.0)
let UI_FONT_TABLE_TITLE = UIFont(name: THEME_FONT_PRIMARY, size: 16.0)
let UI_FONT_TABLE_DESCRIPTION = UIFont(name: THEME_FONT_SECONDARY, size: 11.0)

class AppTheme : NSObject {
    
    static var tabBarController: UITabBarController?
    
    class func applyTheme() {
        
        UITabBar.appearance().barTintColor = UI_BG_COLOR
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UI_FG_COLOR], forState: UIControlState.Selected)
        let fadedColor = UIColor.rgba(THEME_FG_COLOR, alpha: THEME_ICON_OPACITY)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: fadedColor, NSFontAttributeName: UI_FONT_TAB_TEXT!], forState: UIControlState.Normal)
        
        if let theTabBarController = tabBarController {
            for item in theTabBarController.tabBar.items! {
                if let item = item as? UITabBarItem {
                    let image = item.image?.withTintColor(UI_FG_COLOR)
                    let tintedImage = image?.alpha(CGFloat(THEME_ICON_OPACITY))
                    item.selectedImage = image?.imageWithRenderingMode(.AlwaysOriginal)
                    item.image = tintedImage?.alpha(CGFloat(THEME_ICON_OPACITY)).imageWithRenderingMode(.AlwaysOriginal)
                }
            }
            tabBarController = nil
        }
        
        UINavigationBar.appearance().tintColor = UI_FG_COLOR
        UINavigationBar.appearance().barTintColor = UI_BG_COLOR
        UINavigationBar.appearance().translucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UI_FG_COLOR, NSFontAttributeName: UI_FONT_PAGE_TITLE!]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UI_FG_COLOR, NSFontAttributeName: UI_FONT_BAR_BUTTON_TEXT!], forState: .Normal)
        
        UITableViewCell.appearance().textLabel?.font = UI_FONT_TABLE_TITLE!
        UITableViewCell.appearance().detailTextLabel?.font = UI_FONT_TABLE_DESCRIPTION!
    }
}
