//
//  AddItemViewController.swift
//  StartingCamp
//
//  Created by yimkeul on 3/6/25.
//

import Foundation
import UIKit

class AddItemViewController: UIViewController {

    var inputHandler: ((String, String, String) -> Void)? // title과 description을 받는 handler

    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "제목 입력"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 5.0
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupNavigationBar()
    }

    private func setupUI() {
        view.addSubview(titleTextField)
        view.addSubview(descriptionTextView)

        // Constraints
        NSLayoutConstraint.activate([
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Sizes.padding.value),
            titleTextField.widthAnchor.constraint(equalTo: view.widthAnchor),

            descriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: Sizes.padding.value),
            descriptionTextView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -Sizes.padding.value),
            descriptionTextView.heightAnchor.constraint(equalToConstant: view.bounds.height / 3)
            ])
    }

    private func setupNavigationBar() {
        navigationItem.title = "새로운 다짐"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "추가", style: .done, target: self, action: #selector(addButtonTapped))
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonTapped))

        cancelButton.tintColor = .red
        navigationItem.leftBarButtonItem = cancelButton
    }

    @objc private func addButtonTapped() {
        if let title = titleTextField.text, !title.isEmpty,
            let description = descriptionTextView.text, !description.isEmpty {
            let randomImage = Images.allCases.randomElement()?.rawValue ?? Images.bgImg.rawValue
            inputHandler?(title, description, randomImage)
            dismiss(animated: true)
        }
    }

    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }
}
