//
//  ViewController.swift
//  DailyMissionTableView
//
//  Created by yimkeul on 3/4/25.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    private let tableView = UITableView()
    private let nextButton = UIBarButtonItem()
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        setupTableView()
        setupUIBarButton()
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupUIBarButton() {
        let actionNext = UIAction { [weak self] _ in
            let nextVC = NextViewController()
            self?.navigationController?.pushViewController(nextVC, animated: true)
        }
        
        let actionFruit = UIAction { [weak self] _ in
            let fruitVC = FruitViewController()
            self?.navigationController?.pushViewController(fruitVC, animated: true)
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "과일", primaryAction: actionFruit)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "다음 화면으로", primaryAction: actionNext)
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(items[indexPath.row])"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = items[indexPath.row]
        let detailVC = DetailViewController(itemName: selectedItem)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(detailVC, animated: true)

    }
}
