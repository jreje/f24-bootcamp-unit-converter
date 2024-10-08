//
//  ContentView.swift
//  4_Unit_Converter
//
//  Created by Julianne Rejesus  on 10/8/24.
//

import SwiftUI

struct ContentView: View {
    let units = ["mL", "Liters", "Cups", "Pints", "Gallons"]
    @State private var input = 0.0
    @State private var selectedUnit = ""
    @State private var desiredUnit = ""
    
    let literToMilliliter = 1000.0
    let cupToMilliliter = 236.588
    let pintToMilliliter = 473.176
    let gallonToMilliliter = 3785.41
            
    var inputToMl: Double {
        switch selectedUnit {
                case "mL":
                    return input
                case "Liters":
                    return input * literToMilliliter
                case "Cups":
                    return input * cupToMilliliter
                case "Pints":
                    return input * pintToMilliliter
                default:
                    return input * gallonToMilliliter
                }
    }
    
    var outputValue: Double {
            switch desiredUnit {
            case "mL":
                return inputToMl
            case "Liters":
                return inputToMl / literToMilliliter
            case "Cups":
                return inputToMl / cupToMilliliter
            case "Pints":
                return inputToMl / pintToMilliliter
            default:
                return inputToMl / gallonToMilliliter
            }
        }
    
    var body: some View {

        NavigationStack {
            HStack {
                Text("Volume Converter")
                    .font(.title)
                    .bold()
                Spacer()
            }
            .padding()
            
            Form {
                Section ("Input Value and Unit") {
                    TextField("Input Value", value: $input, format: .number)
                    
                    Picker("Units", selection: $selectedUnit) {
                            ForEach(units, id: \.self) { unit in Text("\(unit)")
                            }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section ("Convert To") {
                    Picker("Units", selection: $desiredUnit) {
                            ForEach(units, id: \.self) { flavor in Text("\(flavor)")
                            }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section ("Output") {
                    Text("\(outputValue, specifier: "%.2f")")
                }
                
            }
                
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}
