//
//  Dot.swift
//  Branches
//
//  Created by David Moreno on 13/10/22.
//

import SwiftUI


class Particle: Identifiable, ObservableObject {
    let id = UUID()
    
    @Published var offset: CGSize
    @Published var color: Color
    @Published var scale: Double
    @Published var child: Particle?
    
    init(offset: CGSize = .zero, color: Color = .primary, scale: Double = 1.0, child: Particle? = nil) {
        self.offset = offset
        self.color = color
        self.scale = scale
        self.child = child
    }
        
}

extension CGSize {
    func projection(_ scale: Double?) -> CGSize {
        return CGSize(width: self.width, height: self.height - 2)
    }
}
