//
//  TreeCanvas.swift
//  Branches
//
//  Created by David Moreno on 13/10/22.
//

import SwiftUI

struct TreeCanvas: View {
    @StateObject var tree = Tree()
    
    var body: some View {
        VStack {
            ZStack {
                Spacer()
                ForEach(tree.particles) { particle in
                    Circle()
                        .frame(width: 5, height: 5)
                        .offset(particle.offset)
                        .foregroundColor(particle.color)
                        .scaleEffect(particle.scale)

                }
//                Spacer()
            }
            .background(Color.red)
            VStack {
                Divider()
                    .padding(.bottom)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            tree.germinate()
        }
    }
}

struct TreeCanvas_Previews: PreviewProvider {
    static var previews: some View {
        TreeCanvas()
    }
}
