//
//  OnboardingVC.swift
//  TechspoolProject
//
//  Created by George Popkich on 19.01.26.
//

import UIKit
import SnapKit

protocol OnboardingViewModelProtocol {
    var setCurrentPage: ((Int) -> Void)? { get set }
    var hideStartButton: ((Bool) -> Void)? { get set }
    func makeCollection() -> UICollectionView
    func numOfPages() -> Int
    func startButtonDidTap()
    func acceptButtonDidTap()
    func refuseButtonDidTap()
}

final class OnboardingVC: UIViewController {
    
    private lazy var collectionView: UICollectionView = viewModel.makeCollection()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = viewModel.numOfPages()
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .appOrange
        pageControl.pageIndicatorTintColor = .lightGray
        return pageControl
    }()
    
    private lazy var startButton: StartButton =
    StartButton(
        target: self,
        selector: #selector(startButtonDidTap)
    )
    .setTitle(.Onboarding.startButtonTitle)
    
    private lazy var acceptButton: UIButton =
    UIButton
        .textButton(
            title: .Onboarding.acceptButtonTitle,
            titleColor: .appOrange,
            titleFont: .appBoldFont(20)
        )
        .withAction(self, #selector(acceptButtonDidTap))
    
    private lazy var refuseButton: UIButton =
    UIButton
        .textButton(
            title: .Onboarding.refuseButtonTitle,
            titleColor: .secondaryLabel,
            titleFont: .appBoldFont(20)
        )
        .withAction(self, #selector(refuseButtonDidTap))
    
    private lazy var bottomContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .appSecondaryBackground
        view.setShadow()
        return view
    }()
    
    private var viewModel: OnboardingViewModelProtocol
    
    init(viewModel: OnboardingViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        viewModel.setCurrentPage = { [weak self] page in
            self?.pageControl.currentPage = page
        }
        viewModel.hideStartButton = { [weak self] isHidden in
            self?.startButton.isHidden = isHidden
            self?.bottomContentView.isHidden = !isHidden
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstrains()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        startButton.applyGradient(colors: [.appOrange, .appOrangeLight])
    }
    
    private func setupUI() {
        view.backgroundColor = .appBackground
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(startButton)
        view.addSubview(bottomContentView)
        bottomContentView.addSubview(refuseButton)
        bottomContentView.addSubview(acceptButton)
        bottomContentView.isHidden = true
    }
    
    private func setupConstrains() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(pageControl.snp.top).offset(-40)
        }
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(startButton.snp.top).offset(-16)
        }
        startButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
        bottomContentView.snp.makeConstraints { make in
            make.height.equalTo(startButton.snp.height)
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
        refuseButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(24)
        }
        acceptButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(24)
        }
    }
    
    @objc private func startButtonDidTap() {
        viewModel.startButtonDidTap()
    }
    
    @objc private func acceptButtonDidTap() {
        viewModel.acceptButtonDidTap()
    }
    
    @objc private func refuseButtonDidTap() {
        viewModel.refuseButtonDidTap()
    }
    
    
}




