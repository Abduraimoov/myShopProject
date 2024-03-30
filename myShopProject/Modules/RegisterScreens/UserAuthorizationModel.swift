//
//  UserAuthorizationModel.swift
//  myShopProject
//
//  Created by Nurtilek on 3/29/24.
//

import UIKit

protocol autorizationModelProtocol: AnyObject {
    func succesUser(surname: String,
                    name: String,
                    phone: String)
    func failureUser()
}

final class UserAuthorizationModel {
    
    static let shared = UserAuthorizationModel(
        surname: "Abduraimov",
        name: "Nurtilek",
        phone: "🇰🇬 +996 709 104 783",
        sessionDate: Date())
    
    weak var controller: autorizationModelProtocol?
     
    private let surname: String
    
    private let name: String
    
    private let phone: String
    
    private let sessionDate: Date
    
    init(controller: autorizationModelProtocol? = nil, surname: String, name: String, phone: String, sessionDate: Date) {
        self.controller = controller
        self.surname = surname
        self.name = name
        self.phone = phone
        self.sessionDate = sessionDate
    }
    
    func isSessionActive(
        surname: String,
        name: String) -> Bool {
            if name == self.name && surname == self.surname {
                controller?.succesUser(
                    surname: surname,
                    name: name,
                    phone: phone)
                return true
            } else {
                controller?.failureUser()
                return false 
            }
        }
}