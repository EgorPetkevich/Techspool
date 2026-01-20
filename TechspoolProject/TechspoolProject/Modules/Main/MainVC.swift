//
//  MainVC.swift
//  TechspoolProject
//
//  Created by George Popkich on 20.01.26.
//

import UIKit
import SnapKit

protocol MainViewModelProtocol {
    var mainTitleText: ((String) -> Void)? { get set }
    func viewWillAppear()
    func getButtonTitle() -> String
    func mainButtonDidTap()
}

final class MainVC: UIViewController {
    
    private enum Constnts {
        static let mainButtonHeight: CGFloat = 50
    }
    
    private lazy var mainButton: UIButton =
    UIButton
        .textButton(
            title: viewModel.getButtonTitle(),
            titleColor: .white
        )
        .withAction(self, #selector(mainButtonDidTap))
    
    private var viewModel: MainViewModelProtocol
    
    init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        viewModel.mainTitleText = { [weak self] title in
            self?.mainButton.setTitle(title, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstrains()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainButton.applyGradient(colors: [.appOrange, .appOrangeLight])
    }
    
    private func setupUI() {
        view.backgroundColor = .appBackground
        view.addSubview(mainButton)
    }
    
    private func setupConstrains() {
        mainButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(Constnts.mainButtonHeight)
            make.center.equalToSuperview()
        }
        mainButton.clipsToBounds = true
        mainButton.cornerRadius = 8.0
    }
    
    @objc private func mainButtonDidTap() {
        viewModel.mainButtonDidTap()
    }
}
