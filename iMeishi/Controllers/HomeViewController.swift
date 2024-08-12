//
//  HomeViewController.swift
//  iMeishi
//
//  Created by Rhys.K on 2024/7/22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var contacts: [Contact] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        contacts = getContacts()
        tableView.reloadData()
    }
    
    /// 取得聯絡人資料
    /// - Returns: [Contact]
    func getContacts() -> [Contact]  {
        let contacts: [Contact] = [
            Contact.init(name: "韓衣", phone: "0912345678", image_url: "https://s.yimg.com/ob/image/4724407c-674e-421e-9417-e732c680f292.jpg", website: "https://www.google.com"),
            Contact.init(name: "大粒餛飩", phone: "0912345678", image_url: "https://s.yimg.com/ob/image/a492ac15-d067-483f-9575-521fa51bb862.jpg", website: "https://tw.yahoo.com"),
            Contact.init(name: "韓衣", phone: "0912345678", image_url: "https://s.yimg.com/ob/image/4724407c-674e-421e-9417-e732c680f292.jpg", website: "https://www.google.com"),
            Contact.init(name: "大粒餛飩", phone: "0912345678", image_url: "https://s.yimg.com/ob/image/a492ac15-d067-483f-9575-521fa51bb862.jpg", website: "https://tw.yahoo.com")
        ]
        
        return contacts
    }
    
    /// 將 contacts render 至 view 上
    /// - Returns: Void
    func renderContacts() -> Void {
        for (index, contact) in contacts.enumerated() {
            let dynamicView = UIImageView()
            let url = URL.init(string: contact.image_url)!
            dynamicView.frame = CGRect(x: 50, y: 100 * (index + 1), width: 200, height: 100)
            dynamicView.load(url:url)
            view.addSubview(dynamicView)
        }
    }
    @IBSegueAction func showDetail(_ coder: NSCoder) -> DetailTableViewController? {
        guard let row = tableView.indexPathForSelectedRow?.row else {
        return nil
        }
        
        let contact = contacts[row]
        
        let controller = DetailTableViewController(coder: coder)
        controller?.contact = contact
        
        return controller
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning/Users/rhys.k/ios-projects/iMeishi/iMeishi/Controllers/ContactTableViewCell.swift Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ContactTableViewCell.self)", for: indexPath) as! ContactTableViewCell

        if (contacts.isEmpty) {
            return cell
        }
        let contact = contacts[indexPath.row]
        cell.name?.text = contact.name
        cell.phone?.text = contact.phone
        let url = URL.init(string: contact.image_url)!
        DispatchQueue.main.async {
            cell.contactImage?.load(url:url)
        }
//        cell.orderIconLabel.text = String(order.user.first!).uppercased()
//        cell.orderUserLabel.text = "\(order.user)"
//        cell.orderDrinkLabel.text = "\(order.drink)"
//        cell.orderDescriptionLabel.text = "\(order.size)．\(order.sugar)．\(order.temperature)"
        //        cell.orderPriceLabel.text = "$\(order.price)"class <#name#>: <#super class#> {
//        <#code#>
//    }
//        
        return cell
    }
}
