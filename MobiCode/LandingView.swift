//
//  LandingView.swift
//  MobiCode
//
//  Created by Coni on 2025-07-01.
//

import Foundation
import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Spacer()
                
                Image(systemName: "chevron.left.slash.chevron.right")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .foregroundColor(.accentColor)
                    .padding(.bottom, 10)
                
                Text("MobiCode")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Code anywhere.")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                NavigationLink(destination: NewFileView()) {
                    Text("New File")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                NavigationLink(destination: NewFileView()) {
                    Text("Open File")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            
            Spacer(minLength: 40)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    LandingView()
}
