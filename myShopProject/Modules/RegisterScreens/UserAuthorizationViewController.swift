//
//  UserAuthorizationViewController.swift
//  myShopProject
//
//  Created by Nurtilek on 3/29/24.
//

import UIKit

class UserAuthorizationViewController: UIViewController{

    private lazy var userAutorizationView = UserAuthorizationView(frame: .zero)
    
    private let sessionManager = UserAuthorizationModel.shared
    
    override func loadView() {
        super.loadView()
        view = userAutorizationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       setupUI()
    }

    private func setupUI() {
        userAutorizationView.delegate = self
        sessionManager.controller = self
    }
    
}

extension UserAuthorizationViewController: UserAuthorizationViewDelegate {
    func userAuthoDelegate() {
        if let name = userAutorizationView.surnameTextFeild.text,
           let surname = userAutorizationView.nameTextFeild.text {
            sessionManager.isSessionActive(surname: name,
                                           name: surname)
        }
    }

}

extension UserAuthorizationViewController: autorizationModelProtocol {
    
    func succesUser(surname: String,
                    name: String,
                    phone: String) {
        let vc = DataBaseViewController()
        vc.name = name
        vc.surname = surname
        vc.phone = phone
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func failureUser() {
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Такое имя пользователья не существуеть!",
                                      preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(acceptAction)
        present(alert, animated: true)
    }
}
