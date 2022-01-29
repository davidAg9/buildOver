//
//  local.swift
//  Build Over
//
//  Created by Dave Agyakwa on 15/01/2022.
//

import Foundation


protocol LocalDataProtocol{
    //user specific
    func addUserLocal( notification:BOUser) -> BOUser
    func updateUserLocal(with userId:String ) -> BOUser
    func getUserLocal(with userId:String ) -> BOUser
    func clearCache() -> Void

    //notification specific
    func addNewNotification(notification:BONotifications) -> Void
    func removeNotification(notificationId:String) -> Void
    func addNewUser(with userId:String,for notificationId:String) -> Void
    func updateNotificationStatus(with status: String)
}

class LocalDataService  {

}
