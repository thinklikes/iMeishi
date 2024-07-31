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
        contacts = getContacts()
        dump("test")
    }
    
    /// 取得聯絡人資料
    /// - Returns: [Contact]
    func getContacts() -> [Contact]  {
        let contacts: [Contact] = [
            Contact.init(name: "a", phone: "0912345678", image_url: "https://s.yimg.com/ob/image/4724407c-674e-421e-9417-e732c680f292.jpg"),
            Contact.init(name: "大粒餛飩", phone: "0912345678", image_url: "https://s.yimg.com/ob/image/a492ac15-d067-483f-9575-521fa51bb862.jpg")
        ]
        tableView.reloadData()
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
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ContactTableViewCell.self)", for: indexPath) as! ContactTableViewCell
dump("124")
        if (contacts.isEmpty) {
            return cell
        }
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.phone
        let url = URL.init(string: contact.image_url)!
        cell.imageView?.load(url:url)
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
