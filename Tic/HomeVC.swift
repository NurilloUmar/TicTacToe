//
//  HomeVC.swift
//  Tic
//
//  Created by apple on 31/05/21.
//

import UIKit

class HomeVC: UIViewController {
    
    var p1 = 0
    var p2 = 0
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet weak var currentPlayerLbl: UILabel!
    @IBOutlet var xoBtns: [UIButton]!
    @IBOutlet weak var containerView: UIView!
    
    var str1 = ""
    var str2 = ""
    
    var isFirstP : Bool = true
    var fps = "X"
    var sps = "O"
    var winners: [[Int]] = [
        [0,1,2],[3,4,5],[6,7,8],
        [0,3,6],[1,4,7],[2,5,8],
        [0,4,8],[2,4,6]
    ]
    
    var fpp:[Int] = [] // First player
    var spp:[Int] = [] // Second player
    var supperWinners: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPlayerLbl.text = str1
        setUpBtns()
        forView()
        scoreLbl.text = "0 : 0"
    }
    
    
    
    
    @IBAction func scoreRestartPressed(_ sender: Any) {
        scoreLbl.text = "0 : 0"
    }
    
    @IBAction func xoBtnsPressed(_ sender: UIButton) {
        
        if isFirstP{
            fpp.append(sender.tag)
        }else{
            spp.append(sender.tag)
        }
        isFirstP ? sender.setTitle(fps, for: .normal) : sender.setTitle(sps, for: .normal)
        isFirstP = !isFirstP
        sender.isEnabled = false
        currentPlayerLbl.text = isFirstP ? str1 : str2
        
        //logika joyi
        if fpp.count >= 3 || spp.count >= 3{
            
            // first
            if isThisCombination(combination: fpp){
                
                for btn in xoBtns {
                    btn.isEnabled = false
                }
                
                p1 += 1
                scoreLbl.text = "\(p1) : \(p2)"
                currentPlayerLbl.text = "\(str1) Won!!!"
                for btn in xoBtns{
                    if supperWinners.contains(btn.tag){
                        UIView.animate(withDuration: 3) {
                            btn.transform = .init(scaleX: 0.7, y: 0.7)
                        }completion: { (_) in
                            btn.transform = .identity
                        }
                    }else{
                        btn.setTitle(nil, for: .normal)
                    }
                }
                return
                
            }
            
            if isThisCombination(combination: spp){
                // second
                for btn in xoBtns {
                    btn.isEnabled = false
                }
                p2 += 1
                scoreLbl.text = "\(p1) : \(p2)"
                currentPlayerLbl.text = "\(str2) Won!!!"
                
                for btn in xoBtns{
                    if supperWinners.contains(btn.tag){
                        UIView.animate(withDuration: 3) {
                            btn.transform = .init(scaleX: 0.5, y: 0.5)
                        }completion: { (_) in
                            btn.transform = .identity
                        }
                    }else{
                        btn.setTitle(nil, for: .normal)
                    }
                }
                return
                
            }
            
            if (spp+fpp).count == 9{
                currentPlayerLbl.text = "TIE 🩳"
            }
            
        }
        
    }
    
    
    
    @IBAction func restartPressed(_ sender: UIButton) {
        for btn in xoBtns {
            btn.setTitle(nil, for: .normal)
            btn.isEnabled = true
        }
        isFirstP = true
        currentPlayerLbl.text = "Player 1"
        fpp.removeAll()
        spp.removeAll()
        supperWinners.removeAll()
        
    }
    
    
    @IBAction func dismiss(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
}




// MARK -> This is for buttons and view

extension HomeVC{
    
    func setUpBtns(){
        for btn in xoBtns {
            btn.layer.cornerRadius = 10
            btn.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            btn.layer.shadowOffset = CGSize(width: 0, height: 0)
            btn.layer.shadowRadius = 2
            btn.layer.shadowOpacity = 0.3
            //  btn.clipsToBounds = true
            btn.setTitle(nil, for: .normal)
        }
        
    }
    
    func forView(){
        containerView.layer.cornerRadius = 15
        containerView.layer.shadowColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowOpacity = 0.9
        //  containerView.clipsToBounds = true
        
    }
    
    
    
    
    func isThisCombination(combination : [Int])->Bool{
        
        if winners.contains(combination){
            return true
        }
        
        for winner in winners{
            
            var array : [Int] = []
            
            for w in winner where combination.contains(w){
                array.append(w)
            }
            
            if array.count == 3{
                supperWinners = winner
                print(supperWinners)
                return true
            }
            
        supperWinners = []
            
        }
        
        return false
    }
    
    
}
