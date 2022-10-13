//
//  Growth.swift
//  Branches
//
//  Created by David Moreno on 13/10/22.
//

import Foundation


class Growth: Identifiable {
    let id: UUID
    var particles: [Particle]
    let creationDate: Date
    
    init(particles: [Particle]) {
        self.id = UUID()
        self.particles = particles
        self.creationDate = Date()
    }
    
    func widen(_ scale: Double) {
        for particle in particles {
            particle.scale = scale
        }
    }
    
}
