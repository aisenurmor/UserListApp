//
//  UserDetailViewModel.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

final class UserDetailViewModel {
    typealias UserInfoListViewDisplay = UserInfoListView.Display
    
    let name: String
    let nameInitials: String
    let userInfoList: UserInfoListViewDisplay
    
    init(with user: User) {
        name = user.name
        nameInitials = user.name.prefix(1).uppercased()
        userInfoList = .init([
            .init(.phone, value: user.phone),
            .init(.email, value: user.email),
            .init(.address, value: user.address.city),
            .init(.website, value: user.website)
        ])
    }
}

