//
//  ViewController.swift
//  Almofire
//
//  Created by Neosoft on 09/08/23.
//
//"userId": 1,
//  "id": 3,
//  "title": "fugiat veniam minus",
//  "completed": false



import UIKit
import Alamofire
struct details{
    var userId : Int
    var title : String
    var completed : Bool
    
}
class ViewController: UIViewController {

    
    @IBOutlet weak var postFirstname: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var data :[String: Any] = [
        "name" : "Saad" ,
        "department" : "Mobile" ,
        "team" : "Ios"
    ]
    
    
    func postdata()
    {
        AF.request("https://dummy.restapiexample.com/api/v1/create" , method: .post , parameters: data ,encoding: JSONEncoding.default ).responseJSON { response in
            switch response.result {
                case .success(let value):
                    // Handle the response data
                    print("Response: \(value)")
                case .failure(let error):
                    // Handle the error
                    print("Error: \(error)")
                }
        }
    }
    func fetchdata()
    {
        AF.request("https://jsonplaceholder.typicode.com/todos/3").validate(statusCode: 200 ..< 300).responseJSON { response in
            switch response.result {
            case .success(let value):
                self.firstname.isHidden = false
                let json = value as! Dictionary<String , Any>
                print(json["title"])
                self.firstname.text = json["title"]! as? String
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }

        }
    
    
    
    
    @IBAction func postData(_ sender: UIButton) {
        postdata()
    }
    
    
    @IBAction func Getdata(_ sender: UIButton) {
        fetchdata()
    }
    

}

