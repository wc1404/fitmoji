//
//  ProfileViewController.swift
//  Fitmoji
//
//  Created by John Martinez on 5/6/20.
//  Copyright © 2020 John Martinez. All rights reserved.
//

import UIKit
import SCSDKBitmojiKit


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var levelLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
        SCSDKBitmojiClient.fetchAvatarURL(completion: { (avatarURL: String?, error: Error?) in
            if ((error) != nil) {
                // handle the error
            } else {
                // load the image
                let url = URL(string: avatarURL!)
                self.profileView.load(url: url!)
            }
        })
        
        let user = Database.users[4]
        
        profileView.image = user.profilePic
        usernameLabel.text = user.username
        scoreLabel.text = user.score.description
        levelLabel.text = user.fitnessLevel
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
