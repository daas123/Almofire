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

    @IBOutlet weak var latname: UILabel!
    @IBOutlet weak var middlename: UILabel!
    @IBOutlet weak var firstname: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func fetchdata()
    {
        AF.request("https://jsonplaceholder.typicode.com/todos/3").validate(statusCode: 200 ..< 300).responseJSON { response in
            switch response.result {
            case .success(let value):
                self.firstname.isHidden = false
                let json = value as! Dictionary<String , Any>
                print(json["title"])
                self.firstname.text = json["title"]! as! String
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }

        }
    
    
    
    
@IBAction func buttonAction(_ sender: UIButton) {
    
        fetchdata()
    }
    
    

}

