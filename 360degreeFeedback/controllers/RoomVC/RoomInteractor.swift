//
//  RoomInteractor.swift
//  360degreeFeedback
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 Ayaal Kaplin. All rights reserved.
//

import Foundation

protocol RoomInteractorProtocol : class {
    func showUsersCount(_ count : Int)
}

class RoomInteractor {
    
    weak var delegate : RoomInteractorProtocol?
    
    
    func getRoomUsersCount(){
        //Request to API
        
        self.delegate?.showUsersCount(100)
        
    }
    
}
