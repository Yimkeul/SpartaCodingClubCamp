//
//  ItemDetailViewController.swift
//  StartingCamp
//
//  Created by yimkeul on 3/6/25.
//

import Foundation
import UIKit

class ItemDetailViewController: UIViewController {
    
    var item: Memo?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.applyFont(for: .detailTitle)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.applyFont(for: .detailDesctiption)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.applyFont(for: .detailDate)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .darkGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        configureView()
    }
    
    private func setupUI() {
        view.addSubview(imageView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        // ImageView constraints: 1/3 of the screen height
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3),

            // ScrollView constraints
            scrollView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // ContentView constraints
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor), // width equal to scrollView
        ])
        
        // Adding labels to contentView
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(descriptionLabel)
        
        // Title label constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Sizes.padding.value),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Sizes.padding.value),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Sizes.padding.value),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Sizes.innerPadding.value),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Sizes.padding.value),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Sizes.padding.value),
            
            // Description label constraints
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Sizes.innerPadding.value),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Sizes.padding.value),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Sizes.padding.value),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Sizes.padding.value) // Bottom constraint
        ])
    }
    
    private func configureView() {
        guard let item = item else { return }
        imageView.image = UIImage(named: item.imageName ?? Images.bgImg.rawValue)
        titleLabel.text = item.title
        dateLabel.text = item.date?.formattedDate()
        descriptionLabel.text = item.desc
    }
}
