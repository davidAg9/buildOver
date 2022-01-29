//
//  SignInViewModel.swift
//  Build Over
//
//  Created by Dave Agyakwa on 16/01/2022.
//

import Foundation
import AuthenticationServices

class SigInViewModel :ObservableObject{

    @Published  var signing: Bool = false

    @Published var isSignedIn:Bool = false

    init(){
        autoSignIn()
    }
    func SignAndSaveUser(id userId:String,name fullname:String , email:String ) -> Void {


        isSignedIn = !userId.isEmpty
    }



    func autoSignIn() -> Void {
        signing = true

        signing = false
    }

}
