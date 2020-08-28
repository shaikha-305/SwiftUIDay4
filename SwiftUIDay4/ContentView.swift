//
//  ContentView.swift
//  SwiftUIDay4
//
//  Created by shaikha aljenaidel on 8/26/20.
//  Copyright © 2020 shaikha aljenaidel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var weight = ""
    @State var height = ""
    @State var bmi = "0.0"
    @State var status = "-"
    var body: some View {

        ZStack{
            Image("bmiBG")
        VStack{
        Text("Welcome to BMI Calculator")
            .font(.title).bold()
        TextField("Enter height in (m)", text: $height)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 350)
        TextField("Enter weight in (kg)", text: $weight)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 350)
        Button(action: {
            self.calculateBmiAndUpdateView()
        }) {
        Text("calculate")
            .foregroundColor(.black)
            .font(.system(size: 25))
            .padding(.vertical, 14)
            .padding(.horizontal, 50)
            .background(Color(#colorLiteral(red: 0.9795667529, green: 0.9255431294, blue: 0.92539078, alpha: 1)))
            .clipShape(Capsule())
        }
        .padding()
            Text("BMI")
                .font(.system(size: 40)).bold()
            Text(bmi)
                .font(.system(size: 80)).bold()
                .padding(.bottom)
            Text("Status")
            .font(.system(size: 40)).bold()
            Text(status)
            .font(.system(size: 80)).bold()
        }.padding(.all)
    }
    }
    func calculateBMI(height: Double, weight: Double) -> Double{
        return weight / (height*height)
    }
    func bmiStatus(bmi: Double) -> String{
        switch bmi {
        case ..<20:
            return "ضعيف"
        case ..<25:
            return "جيد"
        default:
            return "سمين"
        }
    }
    func calculateBmiAndUpdateView(){
        let weight = Double(self.weight)!
        let height = Double(self.height)!
        let bmi = calculateBMI(height: height, weight: weight)
        let bmiStatus = self.bmiStatus(bmi: bmi)
        self.bmi = String(format: "%.1f", bmi)
        self.status = bmiStatus
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
