//
//  CollectionViewController.swift
//  Lesson 68
//
//  Created by Lucas Derraugh on 10/10/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

class CollectionViewController: NSViewController {
    
    @IBOutlet var collectionView: NSCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionViewItem.self, forItemWithIdentifier: CollectionViewItem.reuseIdentifier)
        
        collectionView.collectionViewLayout = bidirectionalLayout()
    }
    
    // Bidirection Scrolling
    private func bidirectionalLayout() -> NSCollectionViewLayout {
        let leadingItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.7),
            heightDimension: .fractionalHeight(1.0)))
        leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let trailingItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.3)))
        trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        let trailingGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3),
                                               heightDimension: .fractionalHeight(1.0)),
            subitem: trailingItem, count: 2)
        
        let containerGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalHeight(1.4),
                                               heightDimension: .fractionalHeight(0.5)),
            subitems: [leadingItem, trailingGroup])
        let section = NSCollectionLayoutSection(group: containerGroup)
        section.orthogonalScrollingBehavior = .continuous
        
        let layout = NSCollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    // Varying sections
    private func varyingSectionsLayout() -> NSCollectionViewLayout {
        let layout = NSCollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in
            let columns = (sectionIndex * 2) + 1
            
            // The `group` auto-calculates the actual item width to make the requested number of `columns` fit,
            // so this `widthDimension` will be ignored.
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let groupHeight = columns == 1 ?
                NSCollectionLayoutDimension.absolute(44) : NSCollectionLayoutDimension.fractionalWidth(0.2)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            return section
        }
        return layout
    }
    
    // Grid
    private func gridLayout() -> NSCollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = NSCollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    // List
    private func listLayout() -> NSCollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(40))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = NSCollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension CollectionViewController: NSCollectionViewDataSource {

    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: CollectionViewItem.reuseIdentifier, for: indexPath)
        item.textField?.stringValue = "\(indexPath.section), \(indexPath.item)"
        return item
    }
}
