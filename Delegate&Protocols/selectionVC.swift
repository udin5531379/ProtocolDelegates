//
//  selectionVC.swift
//  Delegate&Protocols
//
//  Created by Udin Rajkarnikar on 2/22/21.
//

import Foundation
import UIKit

protocol didTapper {
    func didTap(nameLabel : String?)
}

class selectionVC : UIViewController {
    //boss screen which consists of all the logic
    //jun ma display garnauney ho tyo chahe intern adn jun ley list of instructions as a function dincha tyo chahe boss
    
    var selectionScreenDelegate: didTapper! //selectionScreenDelegate is the intern
    
    var textfield : UITextField = {
       let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Enter Your Name"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    var button : UIButton = {
       let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        view.addSubview(button)
        view.addSubview(textfield)
        constraints()
    }
    
    @objc func buttonTapped() {
        selectionScreenDelegate.didTap(nameLabel: textfield.text)
        self.dismiss(animated: true, completion: nil)
    }
    
    func constraints() {
        textfield.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textfield.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        textfield.widthAnchor.constraint(equalToConstant: 300).isActive = true
        textfield.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        button.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}


