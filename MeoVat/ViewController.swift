
import SideMenu

import UIKit
import Kingfisher


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,
                      MenuListControllerDelegate,
                      UINavigationControllerDelegate{
    
    var titleLession = ["Sức khoẻ và Cuộc sống", "Thí nghiệm khoa học", "Ảo thuật", "Trẻ nhỏ và cách dạy", "Học đường", "Điện thoại","Hội hoạ"]
    var lession = ["52 mục", "19 mục", "36 mục", "63 mục", "17 mục", "9 mục","29 mục"]
    var image = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9dGXP897Ab_xOf-vs95qXnz2vSkMyOelaPAIlMVGe5uhxRrJ4XMOpUY2t21E9XSEYtDY&usqp=CAU", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGiJEavRb_UHK-ITU6tgyD5mSYTk_qWCmn8vTr5kX1biL80HEOLMWDm5EL_kZw2zJn6pY&usqp=CAU", "https://cdn2.vectorstock.com/i/1000x1000/27/01/magician-with-hat-and-playing-cards-vector-18092701.jpg", "https://imgs.vietnamnet.vn/Images/vnn/2014/10/22/14/20141022145041-10-cach-day-con-thong-minh-cha-me-nao-cung-co-the-lam2.jpg", "https://lh3.googleusercontent.com/proxy/E4TOF9s-TcJ3UvyJFGUHrREIueDeG8wo-8wjqdbghUCcY4jjNKCepfeOWTer_kfeASn8nxOzdu1Wcaj-p5pCjkawNNciiuii_M_tMzgcYQ", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOl8lkzN9AomSvmIQKVKOvwTs-Lh3e-pSVZdVUN1-PiLPL5x2_mlhGxoQK_GT2HslyxRE&usqp=CAU","http://2.bp.blogspot.com/-L9bcjbLRTwU/VB-Vetdf2-I/AAAAAAAACwU/lVQuBY3SgtE/s1600/tranh-ve-cua-%2BFlorian-Nicolle-1.jpg"]
    
    let url = URL(string: "https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg")
    var idLession = 1

    @IBOutlet weak var tabBar: UINavigationItem!
    @IBOutlet weak var menuList: UIView!
    @IBOutlet weak var searchIcon: UIBarButtonItem!
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgGoSearch: UIImageView!
    
 
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellHome", for: indexPath) as! CustomTableViewCell
        cell.titleText.text = titleLession[indexPath.row]
        cell.imgLeft.kf.setImage(with: URL(string: image[indexPath.row]))
        cell.totalLesstion.text = lession[indexPath.row]
        cell.viewCell.layer.borderWidth = 1
        
        return cell
    }

    @IBAction func onPressSearch(_ sender: Any) {
        if searchText.isHidden {
            searchText.text=""
            searchText.isHidden=false
            searchText.layer.borderWidth=1
            imgGoSearch.isHidden=false
        }else{
            searchText.text=""
            searchText.isHidden=true
            searchText.layer.borderWidth=1
            imgGoSearch.isHidden=true
        }

    }
    @objc func onPressGoSearchScreen(tapGestureRecognize: UITapGestureRecognizer) {

        _ = tapGestureRecognize.view as! UIView
        let create = storyboard?.instantiateViewController(identifier: "search") as! SearchViewController
        create.search = searchText.text!
        navigationController?.pushViewController(create, animated: true)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        var orderNumber=indexPath.row+1

        switch orderNumber {
         
            case 1:
            idLession=1

                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPress(tapGestureRecognize:)))
                self.tableView.addGestureRecognizer(tapGestureRecognizer)
                break;
         
            case 2:
                idLession=2
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPress(tapGestureRecognize:)))
                tableView.addGestureRecognizer(tapGestureRecognizer)
                break;
            case 3:
                idLession=3
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPress(tapGestureRecognize:)))
                tableView.cellForRow(at: indexPath)?.addGestureRecognizer(tapGestureRecognizer)
                break;
        case 4:
            idLession=4
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPress(tapGestureRecognize:)))
            tableView.cellForRow(at: indexPath)?.addGestureRecognizer(tapGestureRecognizer)
            break;
        case 5:
            idLession=5
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPress(tapGestureRecognize:)))
            tableView.cellForRow(at: indexPath)?.addGestureRecognizer(tapGestureRecognizer)
            break;
            default:
            print("No Matching")
        }
    }
    @objc func onPress(tapGestureRecognize: UITapGestureRecognizer){

        _ = tapGestureRecognize.view as! UIView
        let create = storyboard?.instantiateViewController(identifier: "healthyView") as! HealthyViewController
        create.number = idLession

        navigationController?.pushViewController(create, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.view.setNeedsLayout()
    }
     
    override func viewDidAppear(_ animated: Bool) {
        self.view.layoutIfNeeded()
    }
    var menu: SideMenuNavigationController?
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu1=MenuListController()
        
        
        searchText.isHidden=true
        imgGoSearch.isHidden=true
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(onPressGoSearchScreen(tapGestureRecognize:)))
        imgGoSearch.isUserInteractionEnabled = true
        imgGoSearch.addGestureRecognizer(singleTap)
      

        menu = SideMenuNavigationController(rootViewController:MenuListController())
        
        menu1.delegate=self
        
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func didTapMenu(){
        present(menu!, animated: true, completion: nil)
    }
        
    func didSelectMenuItem(name: String) {
        print("12355")
        menu?.dismiss(animated: true, completion: {
            print("vao day roi")
            if name == "Danh sách yêu thích" {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "FavotiteViewController") as! FavotiteViewController
                self.modalPresentationStyle = .overFullScreen
              
                        let navigationController = UINavigationController(rootViewController: vc)
                self.present(navigationController, animated: true, completion: nil)
            }
        })
    }
    
}





protocol MenuListControllerDelegate {
    func didSelectMenuItem(name:String)
}

class MenuListController: UITableViewController {

    public var delegate: MenuListControllerDelegate?

    var items=["Đánh giá app","Thông tin","Danh sách yêu thích"]
    let darkColor = UIColor.init(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = darkColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColor

        return cell
    }



    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 0 {
           }

           else if indexPath.row == 2 {
           
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavotiteViewController") as! FavotiteViewController
          
                    let navigationController = UINavigationController(rootViewController:vc)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true, completion: nil)
           }
    }
    
    
    
}


class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var totalLesstion: UILabel!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var imgLeft: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

