//
//  SportCollectionViewCellScreen.swift
//  login-viewcode
//
//  Created by Fernando Moreira on 22/08/22.
//

import UIKit

class SportCollectionViewCellScreen: UIView {

//    lazy var viewBackground: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .clear
//        return view
//    }()
    
    lazy var imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var sportName: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
//        self.addSubview(self.viewBackground)
        self.addSubview(self.imageView)
        self.addSubview(self.sportName)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
//            self.viewBackground.topAnchor.constraint(equalTo: self.topAnchor),
//            self.viewBackground.leftAnchor.constraint(equalTo: self.leftAnchor),
//            self.viewBackground.rightAnchor.constraint(equalTo: self.rightAnchor),
//            self.viewBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.imageView.bottomAnchor.constraint(equalTo: self.sportName.topAnchor, constant: -10),
            
            self.sportName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.sportName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.sportName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            self.sportName.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
