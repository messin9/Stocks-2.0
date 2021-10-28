//
//  StockCell.swift
//  Stocks 2.0
//
//  Created by Алексей Мотин on 25.10.2021.
//
import UIKit
import SnapKit

class StockCell: UITableViewCell {
    
    private let logoImage = UIImageView()
    private let tickerLabel = UILabel()
    private let companyNameLabel = UILabel()
    private let priceLabel = UILabel()
    private let changeLabel = UILabel()
    private let favouriteButton = UIButton()
    private let namesStackView = UIStackView()
    private let pricesStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func bindViewWith(viewModel: StockCellVM) {
    }
    
    private func setupLogo() {
        contentView.addSubview(logoImage)
        logoImage.layer.cornerRadius = self.layer.cornerRadius / 2
        logoImage.snp.makeConstraints { make in
            make.width.height.equalTo(60)
            make.centerY.equalToSuperview()
            make.left.equalTo(contentView.snp.leftMargin)
        }
    }
    
    private func setupNamesStackView() {
        contentView.addSubview(namesStackView)
        namesStackView.axis = .horizontal
        namesStackView.distribution = .fill
        namesStackView.alignment = .fill
        namesStackView.spacing = 4
        namesStackView.addArrangedSubview(priceLabel)
        namesStackView.addArrangedSubview(changeLabel)
        namesStackView.snp.makeConstraints { make in
            make.left.equalTo(logoImage)
        }
    }
}
