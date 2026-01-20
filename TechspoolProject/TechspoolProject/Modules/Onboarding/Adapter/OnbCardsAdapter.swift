//
//  OnbCardsAdapter.swift
//  TechspoolProject
//
//  Created by George Popkich on 20.01.26.
//

import UIKit

final class OnbCardsAdapter: NSObject {
    
    var cardChanged: ((Int) -> Void)?
    
    private var pageIndex: Int = 0 {
        didSet {
            cardChanged?(pageIndex)
        }
    }
    
    var cards: [OnbCardsCells] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView =
        UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        
        return collectionView
    }()
    
    private let layout = OnbCardsStackLayout()
    
    override init() {
        super.init()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(OnbCardCell.self)
    }
    
    private func updateCurrentPageIfNeeded() {
        let centerX = collectionView.contentOffset.x + collectionView.bounds.width / 2
        let itemWidth = collectionView.bounds.width - 2 * 36 + 50
        guard itemWidth > 0 else { return }
        let currentPage = Int(round(centerX / itemWidth))
        let currentPageIndex = max(0, min(currentPage - 1, cards.count - 1))
        self.pageIndex = currentPageIndex
//        self.cardChanged?(currentPageIndex)
    }
    
}

extension OnbCardsAdapter: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return cards.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let card = cards[indexPath.row]
        let cell: OnbCardCell = collectionView.dequeue(at: indexPath)
        cell.configure(with: card)
        return cell
    }
    
}

extension OnbCardsAdapter: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateCurrentPageIfNeeded()
    }
    
}

extension OnbCardsAdapter: OnbCardsAdapterProtocol {
    
    func makeCollectionView() -> UICollectionView {
        return collectionView
    }
    
    func reloadData(with cards: [OnbCardsCells]) {
        self.cards = cards
    }

    func swipeCard() {
        let offsetX = collectionView.contentOffset.x + collectionView.bounds.width + 200
        let maxOffsetX = collectionView.contentSize.width - collectionView.bounds.width
        let newOffset = min(offsetX, maxOffsetX)
        
        collectionView.setContentOffset(CGPoint(x: newOffset, y: 0), animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.updateCurrentPageIfNeeded()
        }
    }
    
    
}

