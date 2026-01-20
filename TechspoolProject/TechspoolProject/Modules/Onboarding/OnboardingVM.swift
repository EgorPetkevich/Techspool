//
//  OnboardingVM.swift
//  TechspoolProject
//
//  Created by George Popkich on 19.01.26.
//

import UIKit

protocol OnbCoordinatorProtocol {
    func finish()
}

protocol OnbCardsAdapterProtocol {
    var cardChanged: ((Int) -> Void)? { get set }
    func makeCollectionView() -> UICollectionView
    func reloadData(with cards: [OnbCardsCells])
    func swipeCard()
}

final class OnboardingVM: OnboardingViewModelProtocol {
    
    var setCurrentPage: ((Int) -> Void)?
    var hideStartButton: ((Bool) -> Void)?
    
    private let cards: [OnbCardsCells] = OnbCardsCells.allCases
    
    private let coordinator: OnbCoordinatorProtocol
    private var adapter: OnbCardsAdapterProtocol
    
    init(
        coordinator: OnbCoordinatorProtocol,
        adapter: OnbCardsAdapterProtocol
    ) {
        self.coordinator = coordinator
        self.adapter = adapter
        commonInit()
        bind()
    }
    
    private func commonInit() {
        adapter.reloadData(with: cards)
    }
    
    private func bind() {
        adapter.cardChanged = { [weak self] currentPage in
            guard let self else { return }
            setCurrentPage?(currentPage)
            let onLastPage: Bool = cards.count - 1 == currentPage
            hideStartButton?(onLastPage)
        }
    }
    
    func makeCollection() -> UICollectionView {
        adapter.makeCollectionView()
    }
    
    func startButtonDidTap() {
        adapter.swipeCard()
    }
    
    func acceptButtonDidTap() {
        ParametersHelper.set(.onboardDidFinish, value: true)
        coordinator.finish()
    }
    
    func refuseButtonDidTap() {
        coordinator.finish()
    }
    
    func numOfPages() -> Int {
        return cards.count
    }
    
}
