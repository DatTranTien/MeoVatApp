import youtube_ios_player_helper
import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class DetaiViewController: UIViewController, YTPlayerViewDelegate {

    @IBOutlet weak var starLove: UIBarButtonItem!
    @IBOutlet weak var playView: YTPlayerView!
    
    
    var number: Int = 1

    var arrSaveItem=[String]()

    var arrUrl=[String]()
    
    override func viewWillAppear(_ animated: Bool) {
        arrSaveItem = UserDefaults.standard.array(forKey: "item") as? [String] ?? []
    }
    
    override func viewDidAppear(_ animated: Bool) {
        playView.load(withVideoId: self.arrUrl[number-1])
        
        for item in arrSaveItem {
            if item==arrUrl[number-1] {
                self.arrSaveItem.append(arrUrl[number-1])
                starLove.tintColor=UIColor.red
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let parameters: [String: Any] = [
            :]
        
        AF.request("http://localhost:3000/getAllVideo", method: .get, parameters: parameters ,encoding: URLEncoding.default ).response{
            (response) in
            switch response.result{
            case .success(let value):
                do {
                    let myResult=try? JSON(data: response.data!)
                    for i in myResult!.arrayValue {
                       
                        let urlItem = iiii["url"].stringValue
                        self.arrUrl.append(urlItem)
                        self.view.layoutIfNeeded()
                    }
                    print(self.arrUrl[1])
                    
                } catch  {

                    print("error parser: ",error)
                }
            case .failure(let err):
                print("Error Res:",err)
            }
        }
        self.title="Xem video"
        starLove.tintColor = UIColor.black
        self.view.backgroundColor=UIColor.red
        playView.delegate=self
        
    }
    
    @IBAction func goBack(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "healthyView") as? HealthyViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func markLove(_ sender: Any) {
        if arrSaveItem.count==0 {
            self.arrSaveItem.append(arrUrl[number-1])
            starLove.tintColor=UIColor.red
            
            UserDefaults.standard.set(arrSaveItem, forKey: "item")
            
            let alert = UIAlertController(title: "Thông báo", message: "Đã thêm vào mục yêu thích!", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else{
            var checkHaveItem=0
        for item in arrSaveItem {
            if item==arrUrl[number-1] {
                checkHaveItem=1+checkHaveItem
            } else {

            }

        }
            if checkHaveItem==0 {
                self.arrSaveItem.append(arrUrl[number-1])
                starLove.tintColor=UIColor.red
                
                UserDefaults.standard.set(arrSaveItem, forKey: "item")
                
                let alert = UIAlertController(title: "Thông báo", message: "Đã thêm vào mục yêu thích!", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Thông báo", message: "Đã Có trong mục yêu thích mục yêu thích!", preferredStyle: .alert)
              
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }

}
