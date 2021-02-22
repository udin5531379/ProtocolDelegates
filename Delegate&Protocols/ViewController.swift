//
//  ViewController.swift
//  Delegate&Protocols
//
//  Created by Udin Rajkarnikar on 2/22/21.
//

import UIKit

class ViewController: UIViewController {
    //intern screen
    var textLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var button : UIButton = {
       let button = UIButton()
        button.setTitle("Delegate", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textLabel)
        view.addSubview(button)
        constraints()
    }
    
    
    @objc func buttonTapped() {
        let secVC = selectionVC()
        secVC.selectionScreenDelegate = self //yesley chahe host jasto gareyko, like secVC bata aako data chahe i am ready to take bhanera in this screen which is the inter screen.
        self.present(secVC, animated: true, completion: nil)
    }
    
    func constraints() {
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        button.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }

}

extension ViewController : didTapper {
    
    func didTap(nameLabel: String?) {
        textLabel.text = nameLabel
    }
}
