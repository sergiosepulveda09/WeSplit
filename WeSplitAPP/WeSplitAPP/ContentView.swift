//
//  ContentView.swift
//  WeSplitAPP
//
//  Created by Sergio Sepulveda on 2021-06-08.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: String = ""
    @State private var numberOfPeople: String = ""
    @State private var tipPercentage: Int = 2
    
    var totalPerPerson: Double {
        let peopleCount: Double = Double(Int(numberOfPeople) ?? 2)
        let tipSelection: Double = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue: Double = orderAmount / 100 * tipSelection
        let grandTotal: Double = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    var totalAmount: Double {
        let tipSelection: Double = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue: Double = orderAmount / 100 * tipSelection
        let grandTotal: Double = orderAmount + tipValue
        return grandTotal
    }
    
    let tipPercentages: [Int] = [10, 15, 20, 25, 0]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("How much is the bill?", text: $checkAmount)
                        .keyboardType(.decimalPad)

                    TextField("Number of people, 2 is default.", text: $numberOfPeople)
                        .keyboardType(.numberPad)

                }
                Section(header: Text("Tip percentage")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) { percentage in
                            Text("\(self.tipPercentages[percentage])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total amount")){
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
