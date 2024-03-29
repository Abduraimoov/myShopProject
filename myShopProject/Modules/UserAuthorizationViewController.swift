//
//  UserAuthorizationViewController.swift
//  myShopProject
//
//  Created by Nurtilek on 3/29/24.
//

import UIKit

class UserAuthorizationViewController: UIViewController {
    
    private lazy var userAutorizationView: UserAuthorizationView = UserAuthorizationView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        view = userAutorizationView
    }


}

extension UserAuthorizationViewController: UserAuthorizationViewDelegate {
    func userAuthoDelegate() {
        
    }
    
}
