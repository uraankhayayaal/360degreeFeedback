//
//  RoomViewController.swift
//  360degreeFeedback
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 Ayaal Kaplin. All rights reserved.
//

import UIKit

class RoomViewController : UIViewController, RoomInteractorProtocol {
    
    @IBOutlet weak var usersCountLabel : UILabel!
    
    
    let interactor = RoomInteractor()
    
    
    static func getVC() -> RoomViewController {
        return RoomViewController(nibName: "RoomViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        interactor.delegate = self
        interactor.getRoomUsersCount()
    }
    
    func showUsersCount(_ count: Int) {
        self.usersCountLabel.text = String(count)
    }
    
}
