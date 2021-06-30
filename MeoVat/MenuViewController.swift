
import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMenu", for: indexPath) as! CustomTableMenu
        cell.layer.borderWidth=1
        cell.backgroundColor=UIColor.cyan
        cell.viewCell.layer.cornerRadius=20
        cell.textTable.text = "Sức khoẻ và Cuộc sống"
        cell.textTable.tintColor=UIColor.white
        cell.icon.image=UIImage(named: "bai1_skcs")
        
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(onPress(tapGestureRecognize:)))
        view.addGestureRecognizer(tapGesture)
        return cell
    }
    
    let tasks=["Short walk",
               "Audiometry",
               "Finger tapping",
               "Reaction time",
               "Spatial span memory"
    ]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("444",indexPath.row)
    }
    
    @objc func onPress(tapGestureRecognize: UITapGestureRecognizer) {
        _ = tapGestureRecognize.view as! UIView
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewAccount: UIView!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var textName: UILabel!
    @IBOutlet weak var textEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        
        viewAccount.backgroundColor=UIColor.lightGray
        self.view.backgroundColor=UIColor.cyan
        
        viewAccount.layer.cornerRadius=40
        
        
        imgAvatar.image=UIImage(named: "avatar")
        textName.text="Trần Tiến Đạt"
        textEmail.text="trantiendatbk@gmail.com1"
        
    }
    
}

class CustomTableMenu: UITableViewCell {
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var textTable: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
