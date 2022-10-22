//
//  SecondViewController.swift
//  transferClouser
//
//  Created by Vladimir Grishchenkov on 22.10.2022.
//

import UIKit


class SecondViewController: UIViewController {

    lazy var dataTextFieldOneVC: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    lazy var dataTextFieldTwoVC: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    lazy var tranferButtonVC: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(buttonTup), for: .touchUpInside)
        return button
    }()
    var text1 = ""
    var text2 = ""

    var clouserOne: ((String) -> ())?
    var clouserTwo: ((String) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupViewLayat()

        dataTextFieldOneVC.text = text1
        dataTextFieldTwoVC.text = text2

    }
    @objc func buttonTup() {
        if let text1 = dataTextFieldOneVC.text, let text2 = dataTextFieldTwoVC.text {
            clouserOne?(text1)
            clouserTwo?(text2)
        }
        dismiss(animated: true)
    }

    func setupViewLayat() {
        [dataTextFieldOneVC, dataTextFieldTwoVC, tranferButtonVC].forEach { view.addSubview($0) }
        NSLayoutConstraint.activate([
            dataTextFieldOneVC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dataTextFieldOneVC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dataTextFieldOneVC.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            dataTextFieldTwoVC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dataTextFieldTwoVC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dataTextFieldTwoVC.topAnchor.constraint(equalTo: dataTextFieldOneVC.bottomAnchor, constant: 45),
            tranferButtonVC.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tranferButtonVC.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
