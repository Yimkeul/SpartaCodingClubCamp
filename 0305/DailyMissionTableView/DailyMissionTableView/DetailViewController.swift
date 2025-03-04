//
//  DetailViewController.swift
//  DailyMissionTableView
//
//  Created by yimkeul on 3/4/25.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    private let label = UILabel()
    let itemName: String
    init(itemName: String) {
        self.itemName = itemName
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLabel()
    }

    private func setupLabel() {
        view.addSubview(label)
        label.text = itemName
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
}
