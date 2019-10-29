//
//  burnerViewController.swift
//  CFB
//
//  Created by AGürani on 4.11.2018.
//  Copyright © 2018 ABDULKADIRGURANI. All rights reserved.
//

import UIKit

class burnerViewController: UIViewController {
    
    @IBOutlet weak var burnersLabel1: UILabel!
    
    @IBOutlet weak var burnerDemandLabel: UILabel!
    @IBOutlet weak var frontWallBurnersAirFlowLAbel: UILabel!
    @IBOutlet weak var frontWallBurnersGasFlowLabel: UILabel!
    @IBOutlet weak var sideWallsBurnersAirFlowLabel: UILabel!
    @IBOutlet weak var sideWallsBurnersGasFlowLabel: UILabel!
    
    
    var burneruserIsInTheMiddleOfTyping = false
    var burnerArrayRow: Int = 0
    var burnerArrayIndexNumber: Int = 0
    var frontWallBurnerAirFlow: Int = 0
    var frontWallBurnerGasFlow: Int = 0
    var sideWallsBurnersAirFlow: Int = 0
    var sideWallsBurnersGasFlow: Int = 0
    
    var frontWallBurnerAirFlowPara = 0.0
    var frontWallBurnerGasFlowPara = 0.0
    var sideWallsBurnersAirFlowPara = 0.0
    var sideWallsBurnersGasFlowPara = 0.0
    
    
    
    @IBOutlet weak var burnerdisplay: UILabel!
    
    @IBAction func burnertouchdigit(_ sender: UIButton) {
        let burnerdigit = sender.currentTitle!
        
        if burneruserIsInTheMiddleOfTyping {
            let burnertextCurrentlyDisplay = burnerdisplay!.text!
            burnerdisplay!.text = burnertextCurrentlyDisplay + burnerdigit
        }
        else {
            burnerdisplay!.text = burnerdigit
            burneruserIsInTheMiddleOfTyping = true
        }
        let burneroperand = Int(burnerdisplay!.text!)!
        
        if (burneroperand + 1) < 102 {
            burnerArrayRow = burneroperand + 1
            burnerDemandLabel.text! = "CFB Burner Demand:            \(burneroperand) %"
        }
        else { burnerArrayRow = 101
            burnerDemandLabel.text! = "CFB Burner Demand:            100 %"
        }
        
        burnerArrayIndexNumber = burnerArrayRow * 5
        frontWallBurnerAirFlow = burnerArrayIndexNumber + 1
        frontWallBurnerGasFlow = burnerArrayIndexNumber + 2
        sideWallsBurnersAirFlow = burnerArrayIndexNumber + 3
        sideWallsBurnersGasFlow = burnerArrayIndexNumber + 4
        
        let burnerList = [0,0,0,0,0,
            0,0.6,550,1.5,937,
            1,0.747,563.5,1.67,937,
            2,0.894,577,1.84,937,
            3,1.041,590.5,2.01,937,
            4,1.188,604,2.18,937,
            5,1.335,617.5,2.35,937,
            6,1.482,631,2.52,937,
            7,1.629,644.5,2.69,937,
            8,1.776,658,2.86,937,
            9,1.923,671.5,3.03,937,
            10,2.07,685,3.2,937,
            11,2.13,698.5,3.273,953.3,
            12,2.19,712,3.346,969.6,
            13,2.25,725.5,3.419,985.9,
            14,2.31,739,3.492,1002.2,
            15,2.37,752.5,3.565,1018.5,
            16,2.43,766,3.638,1034.8,
            17,2.49,779.5,3.711,1051.1,
            18,2.55,793,3.784,1067.4,
            19,2.61,806.5,3.857,1083.7,
            20,2.67,820,3.93,1100,
            21,2.731,833.5,3.997,1115,
            22,2.792,847,4.064,1130,
            23,2.853,860.5,4.131,1145,
            24,2.914,874,4.198,1160,
            25,2.975,887.5,4.265,1175,
            26,3.036,901,4.332,1190,
            27,3.097,914.5,4.399,1205,
            28,3.158,928,4.466,1220,
            29,3.219,941.5,4.533,1235,
            30,3.28,955,4.6,1250,
            31,3.34,968.5,4.654,1262,
            32,3.4,982,4.708,1274,
            33,3.46,995.5,4.762,1286,
            34,3.52,1009,4.816,1298,
            35,3.58,1022.5,4.87,1310,
            36,3.64,1036,4.924,1322,
            37,3.7,1049.5,4.978,1334,
            38,3.76,1063,5.032,1346,
            39,3.82,1076.5,5.086,1358,
            40,3.88,1090,5.14,1370,
            41,3.941,1103.5,5.202,1384,
            42,4.002,1117,5.264,1398,
            43,4.063,1130.5,5.326,1412,
            44,4.124,1144,5.388,1426,
            45,4.185,1157.5,5.45,1440,
            46,4.246,1171,5.512,1454,
            47,4.307,1184.5,5.574,1468,
            48,4.368,1198,5.636,1482,
            49,4.429,1211.5,5.698,1496,
            50,4.49,1225,5.76,1510,
            51,4.55,1238.5,5.823,1524,
            52,4.61,1252,5.886,1538,
            53,4.67,1265.5,5.949,1552,
            54,4.73,1279,6.012,1566,
            55,4.79,1292.5,6.075,1580,
            56,4.85,1306,6.138,1594,
            57,4.91,1319.5,6.201,1608,
            58,4.97,1333,6.264,1622,
            59,5.03,1346.5,6.327,1636,
            60,5.09,1360,6.39,1650,
            61,5.101,1373.5,6.403,1664,
            62,5.112,1387,6.416,1678,
            63,5.123,1400.5,6.429,1692,
            64,5.134,1414,6.442,1706,
            65,5.145,1427.5,6.455,1720,
            66,5.156,1441,6.468,1734,
            67,5.167,1454.5,6.481,1748,
            68,5.178,1468,6.494,1762,
            69,5.189,1481.5,6.507,1776,
            70,5.2,1495,6.52,1790,
            71,5.26,1508.5,6.583,1821,
            72,5.32,1522,6.646,1852,
            73,5.38,1535.5,6.709,1883,
            74,5.44,1549,6.772,1914,
            75,5.5,1562.5,6.835,1945,
            76,5.56,1576,6.898,1976,
            77,5.62,1589.5,6.961,2007,
            78,5.68,1603,7.024,2038,
            79,5.74,1616.5,7.087,2069,
            80,5.8,1630,7.15,2100,
            81,5.861,1643.5,7.212,2115,
            82,5.922,1657,7.274,2130,
            83,5.983,1670.5,7.336,2145,
            84,6.044,1684,7.398,2160,
            85,6.105,1697.5,7.46,2175,
            86,6.166,1711,7.522,2190,
            87,6.227,1724.5,7.584,2205,
            88,6.288,1738,7.646,2220,
            89,6.349,1751.5,7.708,2235,
            90,6.41,1765,7.77,2250,
            91,6.52,1778.5,7.843,2265,
            92,6.63,1792,7.916,2280,
            93,6.74,1805.5,7.989,2295,
            94,6.85,1819,8.062,2310,
            95,6.96,1832.5,8.135,2325,
            96,7.07,1846,8.208,2340,
            97,7.18,1859.5,8.281,2355,
            98,7.29,1873,8.354,2370,
            99,7.4,1886.5,8.427,2385,
            100,7.51,1900,8.5,2400]
        
        print("CFB Burner Demand \(burneroperand)")
        
        
        
        frontWallBurnerAirFlowPara = burnerList[frontWallBurnerAirFlow]
        frontWallBurnersAirFlowLAbel.text! = "Front Wall Burners Air Flow: \(frontWallBurnerAirFlowPara) kg/sec"
        
        frontWallBurnerGasFlowPara = burnerList[frontWallBurnerGasFlow]
        frontWallBurnersGasFlowLabel.text! = "Front Wall Burners Gas Flow: \(frontWallBurnerGasFlowPara) kg/sec"
        
        sideWallsBurnersAirFlowPara = burnerList[sideWallsBurnersAirFlow]
        sideWallsBurnersAirFlowLabel.text! = "Side Walls Burners Air Flow: \(sideWallsBurnersAirFlowPara) kg/sec"
        
        sideWallsBurnersGasFlowPara = burnerList[sideWallsBurnersGasFlow]
        sideWallsBurnersGasFlowLabel.text! = "Side Walls Burners Gas Flow: \(sideWallsBurnersGasFlowPara) kg/sec"
        
    }
    
    @IBAction func burnerTouchClear(_ sender: UIButton) {
        if burneruserIsInTheMiddleOfTyping{
            burnerdisplay!.text = "0"
    }
    
        func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
        
    }
    
    
    @IBAction func mainPage(_ sender: UIButton) {
    }
    
    
}
