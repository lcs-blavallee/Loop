//
//  main.swift
//  Loop
//
//  Created by Benjamin Lavallee on 2024-09-19.
//

import Foundation

func findCountOfRSANumbers(between lower: Int, and upper: Int) -> Int {
    
    var count = 0
    // Loop over numbers in range
    for i in lower...upper {
        // Check whether current number is an RSA number
        let result = isRSA(number: i)
        // Do something based on result...
        if result == true {
            count += 1
        }
    }
    // Return count of RSA numbers in the range given...
    return count
}

func isRSA(number: Int) -> Bool {
    
    var count = 0
    
    // Loop over possible divisors
    for j in 1...number {
        // Check whether current number is a divisor of this number
        let result = isDivisor(dividend: number, divisor: j)
        // Do something based on result...
        print(j)
        print(result)
        if result == true{
            count += 1
        }
    }
    
    
    // Return whether this number is an RSA number...
    if count == 4 {
        return true
    } else {
        return false
    }
}
    
    func getInput(withPrompt prompt: String, minimum: Int?, maximum: Int?) -> Int {
        
        // Loop until a valid value is provided
        while true {
            
            // Prompt the user
            print(prompt)
            
            // Collect the input
            guard let givenInput = readLine() else {
                continue
            }
            
            // Convert to an integer
            guard let givenInteger = Int(givenInput) else {
                continue
            }
            
            // If a lowest value for the integer was specified...
            if let minimumValue = minimum {
                
                // ... then check that the given integer is greater than or equal to the lowest desired value.
                guard givenInteger >= minimumValue else {
                    continue
                }
                
            }
            
            // If an highest possible value for the integer was specified...
            if let maximumValue = maximum {
                
                // ... then check that the given integer is less than or equal to the highest desired value.
                guard givenInteger <= maximumValue else {
                    continue
                }
                
                
            }
            
            // If we've made it past all the checks, the input is an integer in the desired range of values, so, return it
            return givenInteger
            
        }
        
    }
    
    let lowerLimit = getInput(withPrompt: "Enter Lower Limit", minimum: 1, maximum: 999)
    
    let upperLimit = getInput(withPrompt: "Enter Upper Limit", minimum: lowerLimit, maximum: 999)
    
    func isDivisor(dividend: Int, divisor: Int) -> Bool {
        // Add logic to determine whether provided divisor actually
        // goes evenly into the provided dividend
        // (e.g.: remainder is zero)
        
        // Return the result...
        var result = dividend % divisor
        if result == 0 {
            return true
        } else {
            return false
        }
    }
    
    
    print(isDivisor(dividend: 12, divisor: 4)) // True
    
    print(isDivisor(dividend: 7, divisor: 3)) // False
    
    print(isRSA(number: 10)) // True
    
