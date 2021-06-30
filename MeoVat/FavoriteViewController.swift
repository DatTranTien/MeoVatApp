

import UIKit
import youtube_ios_player_helper

class FavotiteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var arrSaveItem=[String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSaveItem.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableFavoriteViewCell
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPress(tapGestureRecognize:)))
        
        cell.playView.layer.borderWidth = 1
        cell.playView.load(withVideoId: self.arrSaveItem[indexPath.row])
        return cell
    }
    
    @objc func onPress(tapGestureRecognize: UITapGestureRecognizer){
        _ = tapGestureRecognize.view as! UIView
        let create = storyboard?.instantiateViewController(identifier: "detail") as! DetaiViewController
        navigationController?.pushViewController(create, animated: true)
    }
    
    @IBAction func comeBackHome(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        arrSaveItem = UserDefaults.standard.array(forKey: "item") as? [String] ?? []
        print("da in ra item trong arrSaveItem",arrSaveItem.count)
        self.tableView?.reloadData()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView?.delegate=self
        tableView?.dataSource=self
        self.tableView.reloadData()
        self.view.backgroundColor=UIColor.yellow
    }
    
}


class CustomTableFavoriteViewCell: UITableViewCell, YTPlayerViewDelegate {
    
    @IBOutlet weak var playView: YTPlayerView!
    @IBOutlet weak var viewCell: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        playView.delegate=self
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
