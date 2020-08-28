//
//  KhatmaCW.swift
//  SwiftUIDay4
//
//  Created by shaikha aljenaidel on 8/26/20.
//  Copyright © 2020 shaikha aljenaidel. All rights reserved.
//

import SwiftUI

struct KhatmaCW: View {
    @State var counter = 0
    let stepperLabel = "كم ختمه تريد أن تختم هذا الشهر؟"
    var body: some View {
        ZStack{
            BG()
            VStack{
                Text("ستحتاج إلى" + " \(counter * 20) " + "عدداً من الصفحات لتقرأها يومياً ")
                    .foregroundColor(.white)
                    .font(.system(size: 21))
                    .padding(.bottom, 30)
                Stepper("كم ختمه تريد أن تختم هذا الشهر؟", value: $counter, in: 0...10)
                    .foregroundColor(.white)
                    .padding()
                HStack{
                   Text(pluralKhatma(counter).0)
                    .foregroundColor(.white)
                    .padding()
                    .font(.largeTitle)
                    Text(pluralKhatma(counter).1)
                    .foregroundColor(.white)
                    .padding()
                    .font(.largeTitle)
                }
            }
        }
    }
    
    func pluralKhatma(_ counter: Int) -> (String, String){
        switch counter{
        case 1: return ("ختمه واحدة", "")
        case 2: return ("ختمتان", "")
        case 3...10: return ("ختمات", "\(counter)")
        default: return ("ختمه", "\(counter)")
        }
    }
}

struct KhatmaCW_Previews: PreviewProvider {
    static var previews: some View {
        KhatmaCW()
    }
}


struct BG: View {
    var body: some View {
        ZStack{
            Image("BACKGROUND")
                .resizable()
            
            VStack{
                Image("Header")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image("Mosque")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
