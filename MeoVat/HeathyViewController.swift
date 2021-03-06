
import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

struct Item: Codable {
    
    let id: Int?
    let title, time, url: String?
    
}



class HealthyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var idVideo = 0
    
    
    var arrTitle=[String]()
    var arrUrl=[String]()
    var arrTime=[String]()
    var number: Int = 1
    
    @IBOutlet weak var tableView: UITableView?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTitle.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomThematicTableViewCell
        
        cell.titleText.text = arrTitle[indexPath.row]
        cell.imgLeft.kf.setImage(with: URL(string: arrUrl[indexPath.row]))
        cell.totalTime.text = arrTime[indexPath.row]
        
        cell.viewCell.layer.borderWidth = 1
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var orderNumber=indexPath.row+1
        
        switch orderNumber {
        
        case 1:
            idVideo=1
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPressGoVideo(tapGestureRecognize:)))
            
            self.tableView?.addGestureRecognizer(tapGestureRecognizer)
            break;
            
        case 2:
            idVideo=2
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPressGoVideo(tapGestureRecognize:)))
            self.tableView?.addGestureRecognizer(tapGestureRecognizer)
            break;
        case 3:
            idVideo=3
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPressGoVideo(tapGestureRecognize:)))
            self.tableView?.cellForRow(at: indexPath)?.addGestureRecognizer(tapGestureRecognizer)
            break;
        case 4:
            idVideo=4
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPressGoVideo(tapGestureRecognize:)))
            self.tableView?.cellForRow(at: indexPath)?.addGestureRecognizer(tapGestureRecognizer)
            break;
        case 5:
            idVideo=5
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPressGoVideo(tapGestureRecognize:)))
            self.tableView?.cellForRow(at: indexPath)?.addGestureRecognizer(tapGestureRecognizer)
            break;
        case 6:
            idVideo=6
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPressGoVideo(tapGestureRecognize:)))
            self.tableView?.cellForRow(at: indexPath)?.addGestureRecognizer(tapGestureRecognizer)
            break;
        default:
            print("No Matching")
        }
    }
    @objc func onPressGoVideo(tapGestureRecognize: UITapGestureRecognizer){
        _ = tapGestureRecognize.view as! UIView
        let create = storyboard?.instantiateViewController(identifier: "detailView") as! DetaiViewController
        create.number = idVideo
        navigationController?.pushViewController(create, animated: true)
        
    }
    
    @objc func onPress(tapGestureRecognize: UITapGestureRecognizer){
        _ = tapGestureRecognize.view!
        let create = storyboard?.instantiateViewController(identifier: "detail") as! DetaiViewController
        navigationController?.pushViewController(create, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView?.reloadData()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var url=""
        
        switch number {
        
        case 1:
            url = "http://localhost:3000/getAllHealthy"
            break;
        case 2:
            url = "http://localhost:3000/getAllLaboratory"
            break;
        case 3:
            url = "http://localhost:3000/getAllMagic"
            break;
        case 4:
            url = "http://localhost:3000/getAllChildren"
            break;
        case 5:
            url = "http://localhost:3000/getAllSchool"
            break;
        default:
            print("No Matching")
        }
        
        
        let parameters: [String: Any] = [
            :]
        
        
        
        AF.request(url, method: .get, parameters: parameters ,encoding: URLEncoding.default ).response{
            (response) in
            switch response.result{
            case .success(let value):
                do {
                    let myResult=try? JSON(data: response.data!)
                    for i in myResult!.arrayValue {
                        let titleItem = i["title"].stringValue
                        self.arrTitle.append(titleItem)
                        let timeItem = i["time"].stringValue
                        self.arrTime.append(timeItem)
                        let urlItem = i["url"].stringValue
                        self.arrUrl.append(urlItem)
                        
                    }
                    self.tableView?.reloadData()
                    
                    let parserData = try JSONDecoder().decode(Array<Item>.self, from: value!)
                    
                } catch  {
                    
                    print("error parser: ",error)
                }
            case .failure(let err):
                print("Error Res:",err)
            }
        }
        
        self.title = "S???c Kho??? V?? Cu???c S???ng"
        
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
    }
    
}




class CustomThematicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var imgLeft: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
