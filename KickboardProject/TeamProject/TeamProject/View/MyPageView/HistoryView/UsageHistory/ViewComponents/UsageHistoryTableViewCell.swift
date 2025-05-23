//
//  UsageHistoryTableViewCell.swift
//  TeamProject
//
//  Created by iOS study on 4/29/25.
//

import UIKit

import SnapKit
import Then

final class UsageHistoryTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let usageHistoryCellid = "UsageHistoryCell"
    
    // MARK: - UI Components
    
    private let leftContentStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.alignment = .center
    }
    
    private let kickboardImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let infoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 3
        $0.alignment = .leading
    }
    
    private let rightContentStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 7
        $0.alignment = .trailing
    }
    
    private let kickboardIdLabel = UILabel().then {
        $0.font = UIFont.fontGuide(.UsageHistoryKickboardID)
        $0.textAlignment = .left
        $0.textColor = .label
    }
    
    private let usageTimeLabel = UILabel().then {
        $0.font = UIFont.fontGuide(.UsageHistoryUseTime)
        $0.textAlignment = .left
        $0.textColor = .secondaryLabel
    }
    
    private let distanceLabel = UILabel().then {
        $0.font = UIFont.fontGuide(.UsageHistoryDistance)
        $0.textAlignment = .left
        $0.textColor = .secondaryLabel
    }
    
    private let dateLabel = UILabel().then {
        $0.font = UIFont.fontGuide(.UsageHistoryDate)
        $0.textAlignment = .right
        $0.textColor = .label
    }
    
    private let chargeLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 15)
        $0.textAlignment = .right
        $0.textColor = UIColor.asset(.main)
    }
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setup() {
        backgroundColor = .clear
        contentView.backgroundColor = UIColor.asset(.gray4)
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        selectionStyle = .none
        
        contentView.addSubview(leftContentStackView)
        contentView.addSubview(rightContentStackView)
        
        leftContentStackView.addArrangedSubview(kickboardImageView)
        leftContentStackView.addArrangedSubview(infoStackView)
        
        [kickboardIdLabel, usageTimeLabel, distanceLabel].forEach {
            infoStackView.addArrangedSubview($0)
        }
        
        rightContentStackView.addArrangedSubviews(dateLabel, chargeLabel)
    }
    
    private func setConstraints() {
        contentView.snp.makeConstraints { make in
            make.width.equalTo(370)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        kickboardImageView.snp.makeConstraints { make in
            make.width.height.equalTo(50)
        }
        
        leftContentStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        rightContentStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(with model: UsageHistory) {
        
        kickboardIdLabel.text = model.kickboardIdentifier.uuidString.prefix(8).uppercased()
        
        if model.finishTime != nil {
            let distance = Date.minutesBetween(model.startTime, and: model.finishTime!)
            usageTimeLabel.text = "사용시간: \(model.startTime) ~ \(model.finishTime!) (\(distance)분)"
        } else {
            usageTimeLabel.text = "사용시간: \(model.startTime) ~ (이용중)"
        }
        
        distanceLabel.text = "이동거리: \(String(format: "%.2f", model.distance))km"
        dateLabel.text = model.useDate
        chargeLabel.text = "\(model.charge.formattedCharge)원"
        kickboardImageView.image = UIImage(named: "kickboard_\(model.type)")
    }
}
