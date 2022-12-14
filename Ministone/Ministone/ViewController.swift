//
//  ViewController.swift
//  Ministone
//
//  Created by Артем Чжен on 14/12/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("3x.png") {
                countries.append(item)
            }
        }
        
//        countries.sort()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].replacingOccurrences(of: "@3x.png", with: "")
        cell.imageView?.image = UIImage(named: countries[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = countries[indexPath.row]
//            vc.imageView?.image = UIImage(named: countries[indexPath.row])
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
