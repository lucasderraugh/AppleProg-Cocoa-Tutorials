//
//  SystemIconWindowController.swift
//  Lesson 70
//
//  Created by Lucas Derraugh on 10/16/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

private enum Section: CaseIterable {
    case custom
    case system
}

final class SystemIconWindowController: NSWindowController {
    
    @IBOutlet private weak var searchField: NSSearchField!
    @IBOutlet private weak var collectionView: NSCollectionView!
    
    private var dataSource: NSCollectionViewDiffableDataSource<Section, SystemIcon>!
    
    private lazy var systemIcons = {
        SystemIcons.generateSystemIcons()
    }()
    
    convenience init() {
        self.init(windowNibName: "SystemIconWindowController")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        collectionView.register(SystemIconCollectionViewItem.self, forItemWithIdentifier: SystemIconCollectionViewItem.reuseIdentifier)
        collectionView.collectionViewLayout = createLayout()
        setupDataSource()
        performQuery("")
    }
    
    private func createLayout() -> NSCollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in
            let contentSize = layoutEnvironment.container.effectiveContentSize
            let columns = Int(contentSize.width / 400) + 1
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .absolute(50))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)

            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

            return section
        }

        let layout = NSCollectionViewCompositionalLayout(sectionProvider: sectionProvider)
        return layout
    }
    
    private func setupDataSource() {
        dataSource = NSCollectionViewDiffableDataSource(collectionView: collectionView) { (collectionView, indexPath, identifier) -> NSCollectionViewItem? in
            let collectionViewItem = collectionView.makeItem(withIdentifier: SystemIconCollectionViewItem.reuseIdentifier, for: indexPath)
            let name = identifier.name
            collectionViewItem.textField?.stringValue = name
            collectionViewItem.imageView?.image = NSImage(named: name)
            return collectionViewItem
        }
//        // Crash occurs if applying 2 sections as first snapshot, so make a fake first one - FB7389368
//        var snapshot = NSDiffableDataSourceSnapshot<Section, SystemIcon>()
//        snapshot.appendSections([.custom])
//        dataSource.apply(snapshot)
    }
    
    private func performQuery(_ string: String) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, SystemIcon>()
        let customIcons = filter(icons(for: .custom), with: string)
        let systemIcons = filter(icons(for: .system), with: string)

        if !customIcons.isEmpty {
            snapshot.appendSections([.custom])
            snapshot.appendItems(customIcons, toSection: .custom)
        }
        snapshot.appendSections([.system])
        snapshot.appendItems(systemIcons, toSection: .system)

        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private func filter(_ icons: [SystemIcon], with string: String) -> [SystemIcon] {
        return string.isEmpty ? icons : icons.filter { $0.name.localizedStandardContains(string) }
    }
    
    private func icons(for section: Section) -> [SystemIcon] {
        let sortedIcons = systemIcons.sorted { $0.name < $1.name }
        switch section {
        case .custom:
            return sortedIcons.filter { $0.userAdded }
        case .system:
            return sortedIcons.filter { !$0.userAdded }
        }
    }
    
    // MARK: - Actions
    
    @IBAction func addItem(_ sender: Any) {
        systemIcons.append(SystemIcon(name: NSImage.mobileMeName, userAdded: true))
        
        performQuery("")
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        // Imperative Approach
        var snapshot = dataSource.snapshot()
        systemIcons.removeAll { $0.userAdded }
        snapshot.deleteSections([.custom])
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension SystemIconWindowController: NSSearchFieldDelegate {
    func controlTextDidChange(_ notification: Notification) {
        guard let control = notification.object as? NSSearchField, control == searchField else { return }
        performQuery(control.stringValue)
    }
}


