//
//  SignInView.swift
//  Build Over
//
//  Created by Dave Agyakwa on 16/01/2022.
//

import AuthenticationServices
import SwiftUI

struct SignInView: View {
    @StateObject private var signInVm = SigInViewModel()
    @State private var isErrorAvailable = false
    

    var body: some View {
        VStack {
            Spacer(minLength: 300)
            Image(systemName: "hammer.circle")
                .resizable()
                .frame(width:120,height: 120)
                .scaledToFit()
                .padding(.bottom,20)
            Text("Less Patrol , More Activities")
                .font(.title2)
                .foregroundColor(.gray)
            Spacer(minLength:1)
            SignInWithAppleButton(.signIn) { request in
                request.requestedScopes = [.fullName, .email]
            } onCompletion: { result in
                switch result {
                    case .success(let auth):
                        switch auth.credential {
                            case let credential as ASAuthorizationAppleIDCredential:
                                let userId = credential.user
                                let fname = credential.fullName?.givenName
                                let lname = credential.fullName?.familyName
                                let name = "\(fname ?? "") \(lname ?? "")"
                                signInVm.SignAndSaveUser(id: userId, name: name, email: credential.email ?? "")
                            default:
                                break
                        }
                    case .failure(let error):
                        isErrorAvailable = true
                        print("\(error.localizedDescription)")
                }
            }
            .frame(height: 50)
            .padding()
            .cornerRadius(15)
            .alert(isPresented: $isErrorAvailable) {
                Alert(title: Text("Apple Sign In"), message: Text("Check your Internet connect and try again"))
            }
            Spacer(minLength: 100)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
