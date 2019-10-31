//
//  SystemIcons.swift
//  Lesson 4
//
//  Created by Lucas Derraugh on 8/14/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import AppKit

struct SystemIcon: Hashable {
    let name: String
    let userAdded: Bool
    let identifier = UUID()
    
    init(name: String, userAdded: Bool) {
        self.name = name
        self.userAdded = userAdded
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: SystemIcon, rhs: SystemIcon) -> Bool {
        return lhs.name == rhs.name
    }
}


final class SystemIcons {

    static func generateSystemIcons() -> [SystemIcon] {
        return names.map { SystemIcon(name: $0, userAdded: false) }
    }

    static let names = [
        NSImage.followLinkFreestandingTemplateName,
        NSImage.invalidDataFreestandingTemplateName,
        NSImage.refreshFreestandingTemplateName,
        NSImage.revealFreestandingTemplateName,
        NSImage.stopProgressFreestandingTemplateName,
        NSImage.menuMixedStateTemplateName,
        NSImage.menuOnStateTemplateName,
        NSImage.multipleDocumentsName,
        NSImage.everyoneName,
        NSImage.userName,
        NSImage.userGroupName,
        NSImage.userGuestName,
        NSImage.advancedName,
        NSImage.preferencesGeneralName,
        NSImage.userAccountsName,
        NSImage.statusAvailableName,
        NSImage.statusNoneName,
        NSImage.statusPartiallyAvailableName,
        NSImage.statusUnavailableName,
        NSImage.applicationIconName,
        NSImage.bonjourName,
        NSImage.folderBurnableName,
        NSImage.cautionName,
        NSImage.computerName,
        NSImage.folderName,
        NSImage.homeTemplateName,
        NSImage.networkName,
        NSImage.folderSmartName,
        NSImage.trashEmptyName,
        NSImage.trashFullName,
        NSImage.colorPanelName,
        NSImage.fontPanelName,
        NSImage.infoName,
        NSImage.mobileMeName
    ]
}
