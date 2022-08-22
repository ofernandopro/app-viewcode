//
//  HomeVC.swift
//  login-viewcode
//
//  Created by Fernando Moreira on 14/08/22.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    
    var dataUser: [DataUser] = [
        DataUser(name: "Fernando", nameImage: "pessoa1"),
        DataUser(name: "Vitória", nameImage: "pessoa2"),
        DataUser(name: "Lucas", nameImage: "pessoa3")
    ]
    
    var dataSport: [Sport] = [
        Sport(name: "Corrida", nameImage: "corrida"),
        Sport(name: "Ciclismo", nameImage: "ciclismo"),
        Sport(name: "Natação", nameImage: "natacao"),
        Sport(name: "Yoga", nameImage: "yoga")
    ]
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configTableViewProtocol(delegate: self, dataSource: self)
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataUser.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 {
            let cell: SportTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
            cell?.dataCollection(data: self.dataSport)
            return cell ?? UITableViewCell()
        }
        
        let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cell?.setupCell(data: self.dataUser[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}



