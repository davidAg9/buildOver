//
//  ProfileViewModel.swift
//  Build Over
//
//  Created by Dave Agyakwa on 16/01/2022.
//

import Foundation


class ProfileViewModel: ObservableObject {
    private var  localStore : LocalDataProtocol

    init(localStoreservice:LocalDataProtocol){
        self.localStore = localStoreservice
    }


    func FetchUserData() -> Void {
        
    }

    func saveUserPhoto() -> Void {

    }

}
