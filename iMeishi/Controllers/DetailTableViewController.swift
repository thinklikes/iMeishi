//
//  DetailViewController.swift
//  iMeishi
//
//  Created by Rhys.K on 2024/7/22.
//

import UIKit

class DetailTableViewController: UITableViewController {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var website: UILabel!
  
    @IBOutlet weak var phone: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var contact: Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = contact.name
        phone.text = contact.phone
        website.text = contact.website
        
        let url = URL.init(string: contact.image_url)!
        DispatchQueue.main.async {
            self.imageView.load(url:url)
        }
    }
}
