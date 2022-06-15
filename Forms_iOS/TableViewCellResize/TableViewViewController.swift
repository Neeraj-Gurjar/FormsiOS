//
//  TableViewViewController.swift
//  Forms_iOS
//
//  Created by bitcot on 03/06/22.
//

import UIKit

class TableViewViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var tableView:UITableView!
    
    var array:[String] = ["1234567890","12345678901234567890","123456789012345678901234567890","1234567890123456789012345678901234567890","1234567890123456789012345678901234567890","1234567890","1234567890","12345678901234567890123456789012345678901234567890123456789012345678901234567890","123456789012345678901234567890","1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"]
    var colorArray:[UIColor] = [UIColor.gray, UIColor.blue,UIColor.green,UIColor.yellow,UIColor.red,UIColor.gray, UIColor.blue,UIColor.green,UIColor.yellow,UIColor.red]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResizeTableViewCell", for: indexPath) as! ResizeTableViewCell
        cell.mainImage.image = UIImage(named: "Image")
        
        cell.label1.text! = array[indexPath.row] as! String
        

        cell.label2.text! = array[indexPath.row] as! String
        cell.label3.text! = array[indexPath.row] as! String
        cell.backgroundColor = colorArray[indexPath.row]
        
        return cell
    }


}
