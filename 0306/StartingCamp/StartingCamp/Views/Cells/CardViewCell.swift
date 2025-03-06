//
//  CardViewCell.swift
//  StartingCamp
//
//  Created by yimkeul on 3/6/25.
//

import Foundation
import UIKit

class CardCell: UICollectionViewCell {

    private var imageHeightConstraint: NSLayoutConstraint!
    private var textStackViewCenterYConstraint: NSLayoutConstraint!
    private var titleStackViewConstraint: NSLayoutConstraint!

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Sizes.corner.value
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.applyFont(for: .title)
        label.numberOfLines = 1
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.applyFont(for: .description)
        label.numberOfLines = 2
        label.textColor = .darkGray
        return label
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.applyFont(for: .date)
        label.textAlignment = .right
        label.textColor = .darkGray
        return label
    }()

    private let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()

    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .firstBaseline
        stackView.distribution = .fillEqually
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.layer.cornerRadius = Sizes.corner.value
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .white

        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(dateLabel)
        
        textStackView.addArrangedSubview(titleStackView)
        textStackView.addArrangedSubview(descriptionLabel)

        contentView.addSubview(imageView)
        contentView.addSubview(textStackView)
    }

    private func setupConstraints() {
        imageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 0)
        textStackViewCenterYConstraint = textStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageHeightConstraint,

            textStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Sizes.innerPadding.value),
            textStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Sizes.innerPadding.value),
            textStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Sizes.innerPadding.value),
            textStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -Sizes.innerPadding.value),
            
            titleStackView.widthAnchor.constraint(equalTo: textStackView.widthAnchor)
        ])
    }
    
    func configure(with memo:Memo) {
        titleLabel.text = memo.title
        descriptionLabel.text = memo.desc
        dateLabel.text = memo.date?.formattedDate()
        imageView.image = UIImage(named: memo.imageName ?? "") ?? UIImage(named: "bgImg")
        imageHeightConstraint.constant = UIViewController().cardImageSize.height
        configureOptions(for: true)
    }

    func configureAsEmptyCard() {
        titleLabel.text = "+"
        descriptionLabel.text = "새로운 항목 추가"
        dateLabel.text = ""
        configureOptions(for: false)
    }
    
    private func getDate(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: date)
    }
    
    private func configureOptions(for type: Bool) {
        // type ? data : emtpy
        textStackView.alignment = type ? .leading : .center
        titleLabel.textAlignment = type ? .left : .center
        descriptionLabel.textAlignment = type ? .left : .center
        dateLabel.isHidden = !type
        imageView.isHidden = !type
        textStackViewCenterYConstraint.isActive = !type
    }
}
