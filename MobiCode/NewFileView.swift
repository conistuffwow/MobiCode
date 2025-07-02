//
//  NewFileView.swift
//  MobiCode
//
//  Created by Coni on 2025-07-01.
//

import Foundation
import SwiftUI

struct FileType: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let iconName: String
    let fileExtension: String
}

struct NewFileView: View {
    let fileTypes = [
        FileType(name: "HTML", iconName: "chevron.left.slash.chevron.right", fileExtension: "html"),
        FileType(name: "CSS", iconName: "paintbrush", fileExtension: "css"),
        FileType(name: "JS", iconName: "curlybraces", fileExtension: "js"),
        FileType(name: "Python", iconName: "chevron.left.slash.chevron.right", fileExtension: "py"),
        FileType(name: "Swift", iconName: "swift", fileExtension: "swift"),
        FileType(name: "Plain Text", iconName: "doc.plaintext", fileExtension: "txt"),
    ]
    
    @State private var selectedFileType: FileType?
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Text("What are you coding in?")
                .font(.title2)
                .bold()
                .padding()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(fileTypes) { type in
                        FileTypeTile(type: type, isSelected: selectedFileType == type)
                            .onTapGesture {
                                selectedFileType = type
                                print("Selected \(type.name)")
                                // TODO
                            }
                        
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
            
            if let selected = selectedFileType {
                Text("Selected \(selected.name)")
                    .font(.headline)
                    .padding()
            }
        }
        .navigationTitle("New File")
    }
}

struct FileTypeTile: View {
    let type: FileType
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: type.iconName)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .foregroundColor(isSelected ? .white : .accentColor )
            Text(type.name)
                .fontWeight(.medium)
                .foregroundColor(isSelected ? .white : .primary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(isSelected ? Color.accentColor : Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(color: isSelected ? Color.accentColor.opacity(0.5) : Color.clear, radius: 5, x: 0, y: 2)
        .animation(.easeInOut(duration: 0.2), value: isSelected)
    }
}
