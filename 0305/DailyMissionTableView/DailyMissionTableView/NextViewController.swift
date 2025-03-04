//
//  NextViewController.swift
//  DailyMissionTableView
//
//  Created by yimkeul on 3/4/25.
//

import UIKit

class NextViewController: UIViewController {
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.backgroundColor = .systemBackground
        setButton()
    }

    private func setButton() {

        button.translatesAutoresizingMaskIntoConstraints = false

        var configuration = UIButton.Configuration.filled()
        configuration.title = "뒤로"
        configuration.baseBackgroundColor = .systemBlue
        configuration.baseForegroundColor = .white
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30)
        button.configuration = configuration

        let action = UIAction { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }

        button.addAction(action, for: .touchUpInside)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
}
