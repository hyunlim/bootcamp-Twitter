//
//  User.swift
//  Bootcamp-Twitter
//
//  Created by Hyun Lim on 2/22/16.
//  Copyright © 2016 Lyft. All rights reserved.
//

import Foundation

public class User: NSObject {
    
    var name: String?
    var screenName: String?
    var profileImageUrl: NSURL?
    var location: String?
    var retweetCount: Int = 0
    var userDescription: String?
    var dictionary: NSDictionary?
    
    init (dictionary: NSDictionary) {
        self.dictionary = dictionary
        self.name = dictionary["name"] as? String
        self.screenName = dictionary["screen_name"] as? String
        self.location = dictionary["location"] as? String
        self.retweetCount = dictionary["retweet_count"] as? Int ?? 0
        self.userDescription = dictionary["description"] as? String
        
        if let url = dictionary["profile_image_url_https"] as? String {
            self.profileImageUrl = NSURL(string: url)
        }
    }
    
}