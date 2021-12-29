//
//  FeedCell.swift
//  InstaCloneFirebase
//
//  Created by Furkan Vardar on 29.12.2021.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var documentIDtext: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func likeButtonClicked(_ sender: Any) {
        let fireStoreDatabase = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!){
            
            let likeStore = ["likes": likeCount + 1]  as [String : Any]
            fireStoreDatabase.collection("Posts").document(documentIDtext.text!).setData(likeStore, merge: true)
        
        }
        
    }
    
}
