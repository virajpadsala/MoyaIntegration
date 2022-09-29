//
//  ViewController.swift
//  MoyaIntegration
//
//  Created by Viraj Padsala on 2022-09-23.
//

import UIKit
import Moya

class ViewController: UIViewController {

    let provider = MoyaProvider<RandomUserAPI>()
    @IBOutlet weak var txtViewJson: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getRandomUser()
    }

    
    @IBAction func loadNewData(_ sender: Any) {
        getRandomUser()
    }
    
    func getRandomUser(){
        provider.request(.basic) { result in
            switch result
            {
            case .success(let ResponseData):
                do{
//                    let filteredResponse = try ResponseData.filterSuccessfulStatusCodes()
//                    let json  = try! JSONSerialization.jsonObject(with: response.data, options:[])
                    print(try ResponseData.mapJSON())
                    let user = try! JSONDecoder().decode(USERData.self , from:ResponseData.data)

//                    let user = try ResponseData.map(USERData.self)
                    print(user.results[1].location)
                    var locationPostcodeString : String = ""
                    user.results.forEach { resultUser in
                        locationPostcodeString.append((resultUser.id.value ?? "No Value Available") + "*-*\n")
                        
                    }
                    self.txtViewJson.text = locationPostcodeString
                    
                }
                catch{
                    print("error mapping")
                }
                
            case .failure(let error):
                print(error)
                print("API error")


            }
        }
    }
    

}

