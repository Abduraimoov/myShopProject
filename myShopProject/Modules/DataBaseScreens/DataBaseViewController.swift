//
//  DataBaseViewController.swift
//  myShopProject
//
//  Created by Nurtilek on 3/29/24.
//

import UIKit

class DataBaseViewController: UIViewController {
    
    var name: String?
    var surname: String?
    var phone: String?
    
    private lazy var dataBase = DataBaseView(frame: .zero)
    
    override func loadView() {
        super.loadView()
        view = dataBase
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserLabels()
    }
    
    private func updateUserLabels() {
        guard let name = name,
             let surname = surname,
             let phonenumber = phone else {
            return
        }
        
        dataBase.updatingLabels(surname: name,
                                name: surname,
                                phonenumber: phonenumber)
    }
    
}

extension DataBaseViewController: DataBaseViewDelegate {
    
}
