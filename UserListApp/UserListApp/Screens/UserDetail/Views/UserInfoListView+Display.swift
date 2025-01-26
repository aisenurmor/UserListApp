//
//  UserInfoListView+Display.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

extension UserInfoListView {
    
    struct Display {
        
        let infoList: [InfoItem]
        
        init(_ infoList: [InfoItem]) {
            self.infoList = infoList
        }
        
        struct InfoItem {
            let type: InfoType
            let value: String
            
            init(
                _ type: InfoType,
                value: String
            ) {
                self.type = type
                self.value = value
            }
        }
        
        enum InfoType {
            case phone, email, address, website
            
            var title: String {
                return switch self {
                case .phone:
                    "Phone"
                case .email:
                    "Email"
                case .address:
                    "Address"
                case .website:
                    "Website"
                }
            }
            
            var iconName: String {
                return switch self {
                case .phone:
                    "phone.circle.fill"
                case .email:
                    "envelope.circle.fill"
                case .address:
                    "mappin.circle.fill"
                case .website:
                    "globe.asia.australia.fill"
                }
            }
        }
    }
}
