



import UIKit
class PlayersVC: UIViewController {

    @IBOutlet weak var p1TF: UITextField!
    
    @IBOutlet weak var p2TF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func playPressed(_ sender: Any) {
        
        let vc = HomeVC(nibName: "HomeVC", bundle: nil)
        
            vc.str1 = p1TF.text!
            vc.str2 = p2TF.text!
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true, completion: nil)
        
    }
    
}
