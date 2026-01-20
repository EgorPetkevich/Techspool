//
//  OnbCardCell.swift
//  TechspoolProject
//
//  Created by George Popkich on 20.01.26.
//

import SwiftUI
import SnapKit

protocol OnbCardCellProtocol {
    var icon: UIImage { get }
    var description: String { get }
    var subtitle: String { get }
}

final class OnbCardCell: UICollectionViewCell {
    
    private enum Const {
        static let iconSize: CGFloat = 160
        static let iconRadius: CGFloat = iconSize / 2
    }
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .appSecondaryBackground
        view.cornerRadius = 5
        view.setShadow(radius: 5)
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .appRegularFont(20)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = .max
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .appBoldFont(20)
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with model: OnbCardCellProtocol) {
        iconImageView.image = model.icon
        descriptionLabel.text = model.description
        subtitleLabel.text = model.subtitle
    }
    
    private func setupUI() {
        contentView.addSubview(cardView)
        cardView.addSubview(iconImageView)
        cardView.addSubview(descriptionLabel)
        cardView.addSubview(subtitleLabel)
    }
    
    private func setupConstraints() {
        cardView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(24)
        }
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.centerX.equalToSuperview()
            make.size.equalTo(Const.iconSize)
        }
        iconImageView.cornerRadius = Const.iconRadius
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().offset(-32)
        }
    }
}
