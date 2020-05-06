//
//  Data.swift
//  Fitmoji
//
//  Created by John Martinez on 5/6/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import Foundation
import UIKit

struct Database {
    
    let challengeTypes = ["Time Based","Most Completed"]
    
    struct User {
        var profilePic: UIImage
        var username: String
        var score: Int
        var fitnessLevel: String
    }
    
    struct Exercise {
        var name: String
        var worth: Int
        var timestamp: Date?
        
        init(name: String, worth: Int) {
            self.name = name
            self.worth = worth
            self.timestamp = nil
        }
    }
    
    struct FriendShip {
        var user1: User
        var user2: User
        var status: Int // 0 Requested, 1 Accepted, 2 declined
    }
    
    struct Challenge {
        var creator: User
        var type: String
        var totalWorth: Int
        var participants: [User]
        var exercises: [Exercise]
        
    }
    
    struct ChallngeRequests {
        var user1: User
        var user2: User
        var challenge: Challenge
        var status: Int // 0 Requested, 1 Accepted, 2 declined
    }
    
    static var exercises = [
        Exercise(name: "Pushups", worth: 30),
        Exercise(name: "Jumprope", worth: 23),
        Exercise(name: "Sit-ups", worth: 45),
        Exercise(name: "Squats", worth: 42),
        Exercise(name: "High-Knees", worth: 26),
        Exercise(name: "Pull-ups", worth: 67),
        Exercise(name: "Dips", worth: 56),
        Exercise(name: "Deadlifts", worth: 65),
        Exercise(name: "Bench Press", worth: 47),
        Exercise(name: "Dumbell Curls", worth: 34)
    ]
    
    static var users = [
        User(profilePic: UIImage(named: "user0")!,
             username: "DanMan",
             score: 35,
             fitnessLevel: "Beginner"),
        User(profilePic: UIImage(named: "user1")!,
        username: "TheRock",
        score: 148,
        fitnessLevel: "Intermmediate"),
        User(profilePic: UIImage(named: "user2")!,
        username: "ManDan",
        score: 40,
        fitnessLevel: "Beginner"),
        User(profilePic: UIImage(named: "user3")!,
        username: "TheStone",
        score: 380,
        fitnessLevel: "Expert"),
        User(profilePic: UIImage(named: "user4")!,
        username: "NotAdmin",
        score: 130,
        fitnessLevel: "Intermmediate")
    ]
    
    static var friendships = [FriendShip]()
    
    static var challenges = [Challenge]()
    
    
    
}
