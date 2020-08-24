//
//  urlDataFromService.swift
//  interViewTask
//
//  Created by Bhargava on 14/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import Foundation
class dataArray:Decodable{
    var description : String?
    var id : Int?
    var thumb : String?
    var title : String?
    var url : String?

    init(jsonData:[String: Any]){
       self.description = jsonData["description"]  as? String
        self.id = jsonData["id"] as? Int
        self.thumb = jsonData["thumb"] as? String
        self.title = jsonData["title"] as? String
        self.url = jsonData["url"] as? String
   }
}
