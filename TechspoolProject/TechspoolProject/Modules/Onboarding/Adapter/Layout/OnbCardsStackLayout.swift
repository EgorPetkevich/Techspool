//
//  OnbCardsStackLayout.swift
//  TechspoolProject
//
//  Created by George Popkich on 20.01.26.
//

import UIKit

final class OnbCardsStackLayout: UICollectionViewLayout {
    
    private enum Constants {
        static let itemInset: CGFloat = 36
        static let distance: CGFloat = 200
        
        static let minScale: CGFloat = 0.9
        static let itemYOffset: CGFloat = 5
    }
    
    private lazy var itemHeight: CGFloat = collectionView?.bounds.height ?? 0
    
    private var attrs: [UICollectionViewLayoutAttributes] = []
    
    // MARK: Override
    
    override func prepare() {
        super.prepare()
        
        attrs = []
        
        guard let collection = collectionView,
              collection.numberOfSections > 0 else {
            return
        }
        
        let itemSize = CGSize(
            width: collection.bounds.width,
            height: itemHeight
        )
        
        let screenCenterX = collection.contentOffset.x + collection.bounds.width / 2
        let number = collection.numberOfItems(inSection: 0)
        
        for i in 0..<number {
            let attr = UICollectionViewLayoutAttributes(forCellWith: IndexPath(row: i, section: 0))
            attr.frame = CGRect(
                x: Constants.itemInset + CGFloat(i) * (itemSize.width + Constants.distance),
                y: collection.bounds.height / 2 - itemHeight / 2,
                width: itemSize.width,
                height: itemSize.height
            )
            
            attr.zIndex = -i
            
            if attr.center.x > screenCenterX {
                let distance = attr.center.x  - screenCenterX
                let maxDistance = CGFloat(number - 1) * (itemSize.width + Constants.distance)
                let scale = Constants.minScale + abs(1 - distance / maxDistance) * (1 - Constants.minScale)
                
                attr.transform = CGAffineTransform(scaleX: scale, y: scale)
                attr.center.x = screenCenterX
                attr.center.y += itemSize.height * (1 - scale)
                
            }
            
            attrs.append(attr)
        }
    }
    
    override var collectionViewContentSize: CGSize {
        guard let collection = collectionView,
              collection.numberOfSections > 0 else { return .zero }
        let number = collection.numberOfItems(inSection: 0)
        let itemWidth = collection.bounds.width - 2 * Constants.itemInset
        let resultWidth = Constants.itemInset + CGFloat(number) * (Constants.distance + itemWidth)
        - Constants.distance
        + Constants.itemInset
        return CGSize(
            width: resultWidth,
            height: collection.bounds.height
        )
    }
    
    override func layoutAttributesForElements(
        in rect: CGRect
    ) -> [UICollectionViewLayoutAttributes]? {
        return attrs.filter { $0.frame.intersects(rect) }
    }
    
    override func layoutAttributesForItem(
        at indexPath: IndexPath
    ) -> UICollectionViewLayoutAttributes? {
        return attrs[indexPath.row]
    }
    
    override func targetContentOffset(
        forProposedContentOffset proposedContentOffset: CGPoint,
        withScrollingVelocity velocity: CGPoint
    ) -> CGPoint {
        guard let collection = collectionView else { return proposedContentOffset }
        
        let itemSize = CGSize(
            width: collection.bounds.width - 2 * Constants.itemInset,
            height: itemHeight
        )
        
        let diff = (Constants.distance / 2 - Constants.itemInset)
        let screenCenterX = proposedContentOffset.x + collection.bounds.width / 2 + diff
        let imaginaryItemWidth = itemSize.width + Constants.distance
        
        let index = Int(screenCenterX / imaginaryItemWidth)
        
        return CGPoint(
            x: CGFloat(index) * imaginaryItemWidth,
            y: proposedContentOffset.y
        )
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool { true }
    
}

