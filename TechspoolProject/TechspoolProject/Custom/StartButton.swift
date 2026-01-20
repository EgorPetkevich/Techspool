//
//  StartButton.swift
//  TechspoolProject
//
//  Created by George Popkich on 19.01.26.
//

import UIKit
import SnapKit

final class StartButton: UIView {
    
    private enum Constnts {
        static let height: CGFloat = 120.0
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.appBoldFont(16.0)
        label.textColor = .white
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        return button
    }()
    
    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    init(target: Any?, selector: Selector) {
        super.init(frame: .zero)
        button.withAction(target, selector)
        commonInit()
    }
    
    required init?(coder: NSCoder, targer: Any, selector: Selector) {
        super.init(coder: coder)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(button)
    }
    
    private func setupConstraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(Constnts.height)
        }
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(24)
        }
    }
    
}

