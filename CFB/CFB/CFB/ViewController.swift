//
//  ViewController.swift
//  CFB
//
//  Created by AGürani on 27.10.2018.
//  Copyright © 2018 ABDULKADIRGURANI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var userIsInTheMiddleOfTyping = false
    var myArrayRow: Int = 0
    var myArrayIndexNumber: Int = 0
    var upperNozzle: Int = 0
    var lowerNozzle: Int = 0
    var O2Level: Int = 0
    var coalConsumption: Int = 0
    var totalAirFlow: Int = 0
    var coalChutesFlow: Int = 0
    var secondaryAirPressure: Int = 0
    var primaryAirFlow: Int = 0
    var burnerAirFlow: Int = 0
    var risingCyclonFlow: Int = 0
    var downcomerCyclonFlow: Int = 0
    var recirculationAirFlow: Int = 0
    var steamFlow: Int = 0
    
    var upperNozzlePara = 0.0
    var lowerNozzlePara = 0.0
    var O2LevelPara = 0.0
    var totalAirFlowPara = 0.0
    var coalConsumptionPara = 0.0
    var coalchutesFlowPara = 0.0
    var secondaryAirPressurePara = 0.0
    var primaryAirFlowPara = 0.0
    var burnerAirFlowPara = 0.0
    var risingCyclonFlowPara = 0.0
    var downcomerCyclonFlowPara = 0.0
    var recirculationflowPara = 0.0
    var steamFlowPara = 0.0
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var CFBBollerLoadLabel: UILabel!
    @IBOutlet weak var SteamFlowLabel: UILabel!
    @IBOutlet weak var PrimaryAirFlowLabel: UILabel!
    @IBOutlet weak var UpperNozzleAirFlowLabel: UILabel!
    @IBOutlet weak var LowerNozzleAirFlowLAbel: UILabel!
    @IBOutlet weak var BurnerNozzleAirFlowLabel: UILabel!
    @IBOutlet weak var CoalChutesAirFlowLabel: UILabel!
    @IBOutlet weak var TotalAirFlowLabel: UILabel!
    @IBOutlet weak var O2LevelLabel: UILabel!
    @IBOutlet weak var CoalConsumptionLabel: UILabel!
    @IBOutlet weak var SecondaryAirPressureLabel: UILabel!
    @IBOutlet weak var RisingCyclonFlowLabel: UILabel!
    @IBOutlet weak var DowncomerCyclonFlowLabel: UILabel!
    @IBOutlet weak var RecirculationAirFlowLAbel: UILabel!
    
    
    
    
    
    @IBOutlet weak var display: UILabel!
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyDispaly = display!.text!
            display!.text = textCurrentlyDispaly + digit
        }
        else {
            display!.text = digit
            userIsInTheMiddleOfTyping = true
        }
        let operand = Int(display!.text!)!
        if (operand + 1) < 102 {
            myArrayRow = operand + 1
            CFBBollerLoadLabel.text! = "CFB Boiler Load:                  \(myArrayRow - 1) %"
        }
        else {
            myArrayRow = 101
            CFBBollerLoadLabel.text! = "CFB Boiler Load:                  100 %"
        }
        
        myArrayIndexNumber = myArrayRow * 14
        upperNozzle = myArrayIndexNumber + 1
        lowerNozzle = myArrayIndexNumber + 2
        O2Level = myArrayIndexNumber + 3
        coalConsumption = myArrayIndexNumber + 4
        totalAirFlow = myArrayIndexNumber + 5
        coalChutesFlow = myArrayIndexNumber + 6
        secondaryAirPressure = myArrayIndexNumber + 7
        primaryAirFlow = myArrayIndexNumber + 8
        burnerAirFlow = myArrayIndexNumber + 9
        risingCyclonFlow = myArrayIndexNumber + 10
        downcomerCyclonFlow = myArrayIndexNumber + 11
        recirculationAirFlow = myArrayIndexNumber + 12
        steamFlow = myArrayIndexNumber + 13
        
        let list = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                    0,9.3,7.1,10,0,11.7,3.6,70,37,0,0.45,0.24,0,0,
                    1,9.3,7.1,9.91,0.4,14.2,3.6,70,37,0.22,0.45,0.24,0,3,
                    2,9.3,7.1,9.82,0.7,16.7,3.6,70,37,0.44,0.45,0.24,0,6,
                    3,9.3,7.1,9.72,1.1,19.2,3.6,70,37,0.66,0.45,0.24,0,10,
                    4,9.3,7.1,9.63,1.5,21.7,3.6,70,37,0.89,0.45,0.24,0,13,
                    5,9.3,7.1,9.54,1.9,24.2,3.6,70,37,1.11,0.45,0.24,0,16,
                    6,9.3,7.1,9.45,2.2,27.7,3.6,70,37,1.33,0.45,0.24,0,19,
                    7,9.3,7.1,9.35,2.6,31.2,3.6,70,37,1.55,0.45,0.24,0,22,
                    8,9.3,7.1,9.26,3,34.7,3.6,70,37,1.77,0.45,0.24,0,26,
                    9,9.3,7.1,9.17,3.3,38.2,3.6,70,37,1.99,0.45,0.24,0,29,
                    10,9.3,7.1,9.08,3.7,41.7,3.6,70,37,2.22,0.45,0.24,0,32,
                    11,9.3,7.1,8.98,4.1,43.5,3.6,70,37,2.44,0.45,0.24,0,35,
                    12,9.3,7.1,8.89,4.4,45.2,3.6,70,37,2.66,0.45,0.24,0,38,
                    13,9.3,7.1,8.8,4.8,47,3.6,70,37,2.88,0.45,0.24,0,42,
                    14,9.3,7.1,8.71,5.2,48.8,3.6,70,37,3.1,0.45,0.24,0,45,
                    15,9.3,7.1,8.61,5.6,50.5,3.6,70,37,3.32,0.45,0.24,0,48,
                    16,9.3,7.1,8.52,5.9,52.3,3.6,70,37,3.54,0.45,0.24,0,51,
                    17,9.3,7.1,8.43,6.3,54,3.6,70,37,3.77,0.45,0.24,0,54,
                    18,9.3,7.1,8.34,6.7,55.8,3.6,70,37,3.99,0.45,0.24,0,58,
                    19,9.3,7.1,8.24,7,57.6,3.6,70,37,4.21,0.45,0.24,0,61,
                    20,9.3,7.1,8.15,7.4,59.3,3.6,70,37,4.43,0.45,0.24,0,64,
                    21,9.3,7.1,8.06,7.8,61.6,3.6,70,37,4.65,0.45,0.24,0,67,
                    22,9.3,7.1,7.97,8.1,63.9,3.6,70,37,4.87,0.45,0.24,0,70,
                    23,9.3,7.1,7.87,8.5,66.2,3.6,70,37,5.09,0.45,0.24,0,74,
                    24,9.3,7.1,7.78,8.9,68.5,3.6,70,37,5.32,0.45,0.24,0,77,
                    25,9.3,7.1,7.69,9.3,70.7,3.6,70,37,5.54,0.45,0.24,0,80,
                    26,9.3,7.1,7.6,9.6,73,3.6,70,37,5.76,0.45,0.24,0,83,
                    27,9.3,7.1,7.5,10,75.3,3.6,70,37,5.98,0.45,0.24,0,86,
                    28,9.3,7.1,7.41,10.4,77.6,3.6,70,37,6.2,0.45,0.24,0,90,
                    29,9.3,7.1,7.32,10.7,79.9,3.6,70,37,6.42,0.45,0.24,0,93,
                    30,9.3,7.1,7.23,11.1,82.2,3.6,70,37,6.65,0.45,0.24,0,96,
                    31,9.3,7.1,7.13,11.5,85.3,3.6,70,37,6.87,0.45,0.24,0,99,
                    32,9.3,7.1,7.04,11.8,88.4,3.6,70,37,7.09,0.45,0.24,0,102,
                    33,9.3,7.1,6.95,12.2,91.5,3.6,70,37,7.31,0.45,0.24,0,106,
                    34,9.3,7.1,6.86,12.6,94.6,3.6,70,37,7.53,0.45,0.24,0,109,
                    35,9.3,7.1,6.76,13,97.8,3.6,70,37,7.75,0.45,0.24,0,112,
                    36,9.3,7.1,6.67,13.3,92.5,3.6,70,37,7.97,0.45,0.24,0,115,
                    37,9.3,7.1,6.58,13.7,87.1,3.6,70,37,8.2,0.45,0.24,0,118,
                    38,9.3,7.1,6.49,14.1,81.8,3.6,70,37,8.42,0.45,0.24,0,122,
                    39,9.3,7.1,6.39,14.4,76.5,3.6,70,37,8.64,0.45,0.24,0,125,
                    40,9.3,7.1,6.3,14.8,71.2,3.6,70,37,8.86,0.45,0.24,0,128,
                    41,9.53,7.27,6.22,15.2,71.6,3.6,72,37,8.86,0.45,0.24,0,131,
                    42,9.76,7.44,6.14,15.5,72,3.6,74,37,8.86,0.45,0.24,0,134,
                    43,9.99,7.61,6.06,15.9,72.4,3.6,76,37,8.86,0.45,0.24,0,138,
                    44,10.22,7.78,5.98,16.2,72.8,3.6,78,37,8.86,0.45,0.24,0,141,
                    45,10.45,7.95,5.9,16.6,73.2,3.6,80,37,8.86,0.45,0.24,0,144,
                    46,10.68,8.12,5.82,16.9,73.6,3.6,82,37,8.86,0.45,0.24,0,147,
                    47,10.91,8.29,5.74,17.3,74,3.6,84,37,8.86,0.45,0.24,0,150,
                    48,11.14,8.46,5.66,17.6,74.4,3.6,86,37,8.86,0.45,0.24,0,154,
                    49,11.37,8.63,5.58,18,74.8,3.6,88,37,8.86,0.45,0.24,0,157,
                    50,11.6,8.8,5.5,18.3,75.2,3.6,90,37,8.86,0.45,0.24,0,160,
                    51,11.84,8.98,5.42,18.7,76.4,3.83,91.6,37.5,8.86,0.45,0.24,0,163,
                    52,12.08,9.16,5.34,19,77.5,4.06,93.2,38,8.86,0.45,0.24,0,166,
                    53,12.32,9.34,5.26,19.4,78.7,4.29,94.8,38.5,8.86,0.45,0.24,0,170,
                    54,12.56,9.52,5.18,19.7,79.8,4.52,96.4,39,8.86,0.45,0.24,0,173,
                    55,12.8,9.7,5.1,20.1,81,4.75,98,39.5,8.86,0.45,0.24,0,176,
                    56,13.04,9.88,5.02,20.5,82.1,4.98,99.6,40,8.86,0.45,0.24,0,179,
                    57,13.28,10.06,4.94,20.8,83.3,5.21,101.2,40.5,8.86,0.45,0.24,0,182,
                    58,13.52,10.24,4.86,21.2,84.4,5.44,102.8,41,8.86,0.45,0.24,0,186,
                    59,13.76,10.42,4.78,21.5,85.6,5.67,104.4,41.5,8.86,0.45,0.24,0,189,
                    60,14,10.6,4.7,21.9,86.7,5.9,106,42,8.86,0.45,0.24,0,192,
                    61,14.23,10.78,4.62,22.2,87.6,5.9,106,42.5,8.86,0.45,0.24,0,195,
                    62,14.46,10.96,4.53,22.6,88.5,5.9,106,43,8.86,0.45,0.24,0,198,
                    63,14.69,11.14,4.45,22.9,89.4,5.9,106,43.5,8.86,0.45,0.24,0,202,
                    64,14.92,11.32,4.36,23.3,90.3,5.9,106,44,8.86,0.45,0.24,0,205,
                    65,15.15,11.5,4.28,23.6,91.3,5.9,106,44.5,8.86,0.45,0.24,0,208,
                    66,15.38,11.68,4.19,24,92.2,5.9,106,45,8.86,0.45,0.24,0,211,
                    67,15.61,11.86,4.11,24.3,93.1,5.9,106,45.5,8.86,0.45,0.24,0,214,
                    68,15.84,12.04,4.02,24.7,94,5.9,106,46,8.86,0.45,0.24,0,218,
                    69,16.07,12.22,3.94,25,94.9,5.9,106,46.5,8.86,0.45,0.24,0,221,
                    70,16.3,12.4,3.85,25.4,95.8,5.9,106,47,8.86,0.45,0.24,0,224,
                    71,16.53,12.58,3.8,25.8,96.7,5.9,106,47.5,8.86,0.45,0.24,0.48,227,
                    72,16.76,12.76,3.74,26.1,97.6,5.9,106,48,8.86,0.45,0.24,0.96,230,
                    73,16.99,12.94,3.69,26.5,98.5,5.9,106,48.5,8.86,0.45,0.24,1.44,234,
                    74,17.22,13.12,3.63,26.8,99.4,5.9,106,49,8.86,0.45,0.24,1.92,237,
                    75,17.45,13.3,3.58,27.2,100.4,5.9,106,49.5,8.86,0.45,0.24,2.4,240,
                    76,17.68,13.48,3.52,27.5,101.3,5.9,106,50,8.86,0.45,0.24,2.88,243,
                    77,17.91,13.66,3.47,27.9,102.2,5.9,106,50.5,8.86,0.45,0.24,3.36,246,
                    78,18.14,13.84,3.41,28.2,103.1,5.9,106,51,8.86,0.45,0.24,3.84,250,
                    79,18.37,14.02,3.36,28.6,104,5.9,106,51.5,8.86,0.45,0.24,4.32,253,
                    80,18.6,14.2,3.3,28.9,104.9,5.9,106,52,8.86,0.45,0.24,4.8,256,
                    81,18.84,14.38,3.28,29.3,105.8,5.9,106.4,52.5,8.86,0.45,0.24,4.86,259,
                    82,19.08,14.56,3.26,29.6,106.7,5.9,106.8,53,8.86,0.45,0.24,4.91,262,
                    83,19.32,14.74,3.24,30,107.6,5.9,107.2,53.5,8.86,0.45,0.24,4.97,266,
                    84,19.56,14.92,3.22,30.3,108.5,5.9,107.6,54,8.86,0.45,0.24,5.02,269,
                    85,19.8,15.1,3.2,30.7,109.4,5.9,108,54.5,8.86,0.45,0.24,5.08,272,
                    86,20.04,15.28,3.18,31.1,110.3,5.9,108.4,55,8.86,0.45,0.24,5.13,275,
                    87,20.28,15.46,3.16,31.4,111.2,5.9,108.8,55.5,8.86,0.45,0.24,5.19,278,
                    88,20.52,15.64,3.14,31.8,112.1,5.9,109.2,56,8.86,0.45,0.24,5.24,282,
                    89,20.76,15.82,3.12,32.1,113,5.9,109.6,56.5,8.86,0.45,0.24,5.3,285,
                    90,21,16,3.1,32.5,114,5.9,110,57,8.86,0.45,0.24,5.35,288,
                    91,21.23,16.17,3.09,32.8,114.9,5.9,110,57.5,8.86,0.45,0.24,5.41,291,
                    92,21.46,16.34,3.08,33.2,115.8,5.9,110,58,8.86,0.45,0.24,5.46,294,
                    93,21.69,16.51,3.07,33.5,116.7,5.9,110,58.5,8.86,0.45,0.24,5.52,298,
                    94,21.92,16.68,3.06,33.9,117.6,5.9,110,59,8.86,0.45,0.24,5.57,301,
                    95,22.15,16.85,3.05,34.2,118.5,5.9,110,59.5,8.86,0.45,0.24,5.63,304,
                    96,22.38,17.02,3.04,34.6,119.4,5.9,110,60,8.86,0.45,0.24,5.68,307,
                    97,22.61,17.19,3.03,34.9,120.3,5.9,110,60.5,8.86,0.45,0.24,5.74,310,
                    98,22.84,17.36,3.02,35.3,121.2,5.9,110,61,8.86,0.45,0.24,5.79,314,
                    99,23.07,17.53,3.01,35.6,122.1,5.9,110,61.5,8.86,0.45,0.24,5.85,317,
                    100,23.3,17.7,3,36,123,5.9,110,62,8.86,0.45,0.24,5.9,320
        ]
        
        print("CFB Boiler Load \(operand)")
        
        
        
        steamFlowPara = list[steamFlow]
        SteamFlowLabel.text! = "Steam Flow:                         \(steamFlowPara) t/h"
        primaryAirFlowPara = list[primaryAirFlow]
        PrimaryAirFlowLabel.text! = "Primary Air Flow:                 \(primaryAirFlowPara) kg/sec"
        upperNozzlePara = list[upperNozzle]
        UpperNozzleAirFlowLabel.text! = "Upper Nozzle Air Flow:    \(upperNozzlePara) kg/sec"
        lowerNozzlePara = list[lowerNozzle]
        LowerNozzleAirFlowLAbel.text! = "Lower Nozzle AirFlow:     \(lowerNozzlePara) kg/sec"
        burnerAirFlowPara = list[burnerAirFlow]
        BurnerNozzleAirFlowLabel.text! = "Burner Nozzle Air Flow:    \(burnerAirFlowPara) kg/sec"
        coalchutesFlowPara = list[coalChutesFlow] / 4
        CoalChutesAirFlowLabel.text! = "Coal Chutes Air Flow:      \(coalchutesFlowPara) kg/sec"
        totalAirFlowPara = list[totalAirFlow]
        TotalAirFlowLabel.text! = "Total Air Flow:                     \(totalAirFlowPara) kg/sec"
        O2LevelPara = list[O2Level]
        O2LevelLabel.text! = "O2 Level:                              \(O2LevelPara) %"
        coalConsumptionPara = list[coalConsumption]
        CoalConsumptionLabel.text! = "Coal consumption:              \(coalConsumptionPara) t/h"
        secondaryAirPressurePara = list[secondaryAirPressure]
        SecondaryAirPressureLabel.text! = "Secondary Air Pressure:   \(secondaryAirPressurePara) mbar"
        risingCyclonFlowPara = list[risingCyclonFlow]
        RisingCyclonFlowLabel.text! = "Rising Cyclon Flow:             \(risingCyclonFlowPara) kg/sec"
        downcomerCyclonFlowPara = list[downcomerCyclonFlow]
        DowncomerCyclonFlowLabel.text! = "Downcomer.Cyclon Flow: \(downcomerCyclonFlowPara) kg/sec"
        recirculationflowPara = list[recirculationAirFlow]
        RecirculationAirFlowLAbel.text! = "Recirculation Air Flow:       \(recirculationflowPara) kg/sec "
        
        
    }
    
    @IBAction func touchClear(_ sender: Any) {
        if userIsInTheMiddleOfTyping {
            display!.text = "0"
        }
        
        
        
        
    }
    
    
    @IBAction func touchBurnerPage(_ sender: Any) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

