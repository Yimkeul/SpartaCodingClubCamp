//
//  AddItemViewController.swift
//  StartingCamp
//
//  Created by yimkeul on 3/6/25.
//

import Foundation
import UIKit

class AddItemViewController: UIViewController {
    
    var inputHandler: ((String, String, String) -> Void)?  // title과 description을 받는 handler
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "제목 입력"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "설명 입력"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("추가", for: .normal)
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("취소", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(titleTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(addButton)
        view.addSubview(cancelButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleTextField.widthAnchor.constraint(equalToConstant: 250),
            
            descriptionTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            descriptionTextField.widthAnchor.constraint(equalToConstant: 250),
            
            addButton.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 30),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cancelButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 10),
            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addButtonTapped() {
        if let title = titleTextField.text, !title.isEmpty,
           let description = descriptionTextField.text, !description.isEmpty {
            inputHandler?(title, description, "bgImg")
            dismiss(animated: true)
        }
    }
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }
}
