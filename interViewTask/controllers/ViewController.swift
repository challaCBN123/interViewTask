//
//  ViewController.swift
//  interViewTask
//
//  Created by Bhargava on 14/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var tbl_View:UITableView!
    var myArray = NSArray()
    let BaseService = servicesToGetData()
    let baseURl = "https://interview-e18de.firebaseio.com/media.json?print=pretty"
    let serviceUrl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tbl_View.delegate = self
        self.tbl_View.dataSource = self
        DataGetting(baseUrl: baseURl)
        nibFile()
        tbl_View.delegate = self
        tbl_View.dataSource = self
    }
    func nibFile(){
        let nibname = UINib.init(nibName: "dataCell", bundle: nil)
        self.tbl_View.register(nibname, forCellReuseIdentifier: "dataCell")
    }
    func DataGetting(baseUrl:String){
        BaseService.getDataFromUrl(baseUrl: baseUrl, serviceUrl: serviceUrl, encoding: PARAMETER_ENCODING.JSON_ENCODING) { (urlData, error) in
            //print(urlData)
            self.myArray = urlData as! NSArray
                      self.tbl_View.reloadData()
              
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl_View.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! dataCell
        let dataFromUrl = myArray[indexPath.row] as! NSDictionary
        //let id = dataFromUrl.value(forKey: "id") as! NSNumber
        let titles = dataFromUrl.value(forKey: "title") as! String
        let image = dataFromUrl.value(forKey: "thumb") as! String
        let urlImage = URL(string: image)
        if let dataImage = try? Data(contentsOf: urlImage!){
            DispatchQueue.global().async {
                DispatchQueue.main.async {
                  cell.videoImage.image = UIImage(data: dataImage)
                }
            }
            
        }
        cell.idLbl.text = "\(String(describing: dataFromUrl.value(forKey: "id")!))"
        cell.titileLb.text = titles
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoPlayer = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "playerVC") as! playerVC
        let dataFromUrl = myArray[indexPath.row] as! NSDictionary
        
        videoPlayer.dataDict = dataFromUrl
       
        self.navigationController?.pushViewController(videoPlayer, animated: true)
    }
}

