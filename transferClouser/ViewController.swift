//
//  ViewController.swift
//  transferClouser
//
//  Created by Vladimir Grishchenkov on 22.10.2022.
//

import UIKit

class ViewController: UIViewController {

    lazy var dataTextFieldOne: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    lazy var dataTextFieldTwo: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    lazy var tranferButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(buttonTup), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupViewLayat()
    }

    @objc func buttonTup() {
        let vc = SecondViewController()
        if let text1 = dataTextFieldOne.text, let text2 = dataTextFieldTwo.text {
            vc.text1 = text1
            vc.text2 = text2
            vc.clouserOne = {[weak self] text1  in
                self?.dataTextFieldOne.text = text1
            }
            vc.clouserTwo = {[weak self] text2 in
                self?.dataTextFieldTwo.text = text2
            }

        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    func setupViewLayat() {
        [dataTextFieldOne, dataTextFieldTwo, tranferButton].forEach { view.addSubview($0) }
        NSLayoutConstraint.activate([
            dataTextFieldOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dataTextFieldOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dataTextFieldOne.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            dataTextFieldTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dataTextFieldTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dataTextFieldTwo.topAnchor.constraint(equalTo: dataTextFieldOne.bottomAnchor, constant: 45),
            tranferButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tranferButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

