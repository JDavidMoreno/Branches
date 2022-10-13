//
//  Tree.swift
//  Branches
//
//  Created by David Moreno on 13/10/22.
//

import Foundation


class Tree: ObservableObject {
    let particleSize: Double
    var growthPercent: Double
    var growthFactorLimit: Double
//    var buds: [Particle]
    var timer: Timer?
    
    @Published var growths: [Growth]

    
    init() {
        particleSize = 5.0
        growthPercent = 0.1
        growthFactorLimit = 1.5
        
        let particle = Particle()
//        buds = [particle]
        growths = [Growth(particles: [particle])]
        
    }
    
    var particles: [Particle] {
        return Array(growths.map({growth in growth.particles}).joined())
    }
    
    var buds: [Particle] {
        return particles.filter({$0.child == nil})
    }
    
    func germinate() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.grow()
        }
    }
    
    private func grow() {
        widen()
        
        var newBuds = [Particle]()
        for bud in buds {
            let newBud = Particle(offset: bud.offset.projection(nil))
            bud.child = newBud
            
            newBuds.append(newBud)
        }
        growths.append(Growth(particles: newBuds))
//        buds = newBuds
    }
    
    private func branch() {
        
    }
    
    private func widen() {
        let growthCount = growths.count
        
        for (antiquity, growth) in zip((0...growthCount).reversed(), growths) {
            let antiquityDouble = Double(antiquity)
            
            let factor = (particleSize + antiquityDouble * growthPercent) / particleSize
            growth.widen(max(factor, 1.0))
//            growth.widen(min(max(factor, 1.0), growthFactorLimit))
        }
    }

    
    
}
