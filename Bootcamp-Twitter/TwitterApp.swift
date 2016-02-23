//
//  TwitterApp.swift
//  Bootcamp-Twitter
//
//  Created by Hyun Lim on 2/23/16.
//  Copyright © 2016 Lyft. All rights reserved.
//

import Foundation

public final class TwitterApp {
    
    private static let SERIALIZED_USER_KEY = "com.lyft.serialized_user_key"
    private static var _currentUser: User?
    private static let defaults = NSUserDefaults.standardUserDefaults()
    
    public static var currentUser: User? {
        get {
            if TwitterApp._currentUser == nil {
                if let data = TwitterApp.defaults.objectForKey(TwitterApp.SERIALIZED_USER_KEY) as? NSData,
                   let dictionary = try! NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary {
                    TwitterApp._currentUser = User(dictionary: dictionary)
                }
        
            }
            return TwitterApp._currentUser
        }
        set(user) {
            if let dictionary = user?.dictionary {
                let obj = try! NSJSONSerialization.dataWithJSONObject(
                    dictionary,
                    options: [])
                TwitterApp.defaults.setObject(
                    obj,
                    forKey: TwitterApp.SERIALIZED_USER_KEY)
            } else {
                TwitterApp.defaults.setObject(
                    nil,
                    forKey: TwitterApp.SERIALIZED_USER_KEY)
            }
            TwitterApp.defaults.synchronize()
        }
    }
    
}