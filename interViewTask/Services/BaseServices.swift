//
//  BaseServices.swift
//  interViewTask
//
//  Created by Bhargava on 14/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import Foundation
import Alamofire
enum PARAMETER_ENCODING{
static var JSON_ENCODING = ""
    static var URL_ENCODIG = ""
}
class servicesToGetData:NSObject{
    func getDataFromUrl(baseUrl:String,serviceUrl:String,encoding:String,completionHandler: @escaping (_ urlData:AnyObject,_ error:String)-> Void){
        AF.request(baseUrl+serviceUrl,method: .get,encoding: JSONEncoding.default).responseJSON { (dataFromUrl) in
            //print(dataFromUrl.data!)
            switch dataFromUrl.result{
            case .success(_):
                completionHandler(dataFromUrl.value as AnyObject, "" )
                break
            case .failure(_):
                let temp:[AnyObject] = []
                completionHandler(temp as AnyObject, dataFromUrl.error?.localizedDescription ?? "")
                print("error")
                break
                
            }
        }
    }
}
