//
//  FruitViewController.swift
//  DailyMissionTableView
//
//  Created by yimkeul on 3/4/25.
//

import UIKit

class FruitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // 과일 이름을 저장할 배열
    var fruits = ["Apple", "Banana", "Cherry"]


    // UI 요소들
    private let tableView = UITableView()
    private let textField = UITextField()
    private let addButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let margins = view.layoutMarginsGuide
        addSubView()
        setupTextField(margins)
        setupAddbutton(margins)
        setupTableView(margins)

    }

    private func addSubView() {
        view.addSubview(textField)
        view.addSubview(addButton)
        view.addSubview(tableView)
    }

    private func setupTextField(_ margins: UILayoutGuide) {
        textField.placeholder = "Enter fruit name"
        textField.borderStyle = .roundedRect

        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -120),
            textField.heightAnchor.constraint(equalToConstant: 40),
            ])
    }

    private func setupAddbutton(_ margins: UILayoutGuide) {
        // 추가 버튼 초기화
        addButton.setTitle("Add", for: .normal)
        addButton.backgroundColor = .blue
        addButton.layer.cornerRadius = 5
        addButton.addTarget(self, action: #selector(addFruit), for: .touchUpInside)

        // 버튼의 Auto Layout 설정 (safe area에 맞게 위치 설정)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            addButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor)
            ])
    }
    
    private func setupTableView(_ margins: UILayoutGuide) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }

    // 테이블 뷰 데이터 소스 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.row]
        return cell
    }

    // 과일을 추가하는 메소드
    @objc func addFruit() {
        guard let newFruit = textField.text, !newFruit.isEmpty else { return }

        // 배열에 새로운 과일 추가
        fruits.append(newFruit)

        // 테이블 뷰에 변경 사항 반영
        tableView.reloadData()

        // 입력 필드 초기화
        textField.text = ""
    }
}
