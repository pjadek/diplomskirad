//
//  ExperienceView.swift
//  Cocktails (iOS)
//
//  Created by Petar Jadek on 27.08.2020..
//

import SwiftUI

struct ExperienceView: View {
    var body: some View {
        
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: Constants.UI.spaceSmall) {
                    Text("8 Super Impressive New Skills You Can Learn While Stuck Inside")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("By Sophie Binns on Tipsy Bartender")
                        .font(.footnote)
                        .padding(.bottom)
                    
                    Text("Let’s be real… quarantine sucks. Coronavirus has swept through the country and left us all stuck indoors, wearing the same pajamas for days at a time, unable to meet our friends for a cocktail when we need it the most (sigh). Sure, you might be bored out of your mind these days, but don’t worry, it’s not all hopeless. Our advice? Make the best of a bad situation and learn how to do something new and exciting. If you’re in need of a few bright ideas, here’s some fun, useful, and impressive new skills you can master during quarantine.").padding(.bottom)
                    
                    Text("Starting a podcast might seem intimidating, but the biggest hurdle is getting going. All you need to get started is a computer, a microphone, and a bright idea. Decide what you want to discuss in your podcast, then get to recording. Who knows? It might turn out way better than you ever expected. (And it’s nice to have someone to talk to right now, even if it is just a microphone.)").padding(.bottom)
                    
                    Text("Ok, so maybe you’re one of those people who can’t even keep a cactus alive. But with a little time and some research, you can teach yourself to be a top-notch plant parent. It’s always best to start with beginner plants that are easy to take care of. There are even online websites that deliver your new plant friends (with all-important care instructions) right to your door! ").padding(.bottom)
                }
                .padding()
                
            }
        
    }
}

