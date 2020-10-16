//
//  Application.swift
//  Created on 11/09/20
//  Created for Bridge - Adopt Your Village
//

import SwiftUI

struct Application: View {
    @ObservedObject var applicationViewModel = ApplicationViewModel()
    @State var firstFetchCalled = false
    func fetchApplication() {
        applicationViewModel.fetchApplications { (applications) in
            applicationViewModel.applicationsList = applications
            firstFetchCalled = true
        }
    }
    var body: some View {
        List {
            ForEach(self.applicationViewModel.applicationsList) { application in
                NavigationLink(destination: ApplicationDetailView(applicationDetail: application, applicationViewModel: applicationViewModel)) {
                    ApplicationListCell(application: application, membersViewModel: applicationViewModel)
                }
            }
            if !firstFetchCalled {
                if self.applicationViewModel.applicationsList.count == 0 {
                    ActivityIndicator(isAnimating: .constant(true))
                        .onAppear {
                            self.fetchApplication()
                        }
                }
            }
            
        }.navigationBarTitle(Text("Application"))
    }
}

struct Application_Previews: PreviewProvider {
    static var previews: some View {
        Application()
    }
}
