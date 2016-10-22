#!/usr/bin/env xcrun -sdk macosx swift

// This script is run in the "Run Script" phase and it copies the shared test code
// to all test cases

import Foundation

let fileManager = FileManager.default
let rootPath = Process().arguments?[1] ?? ""

if let paths = fileManager.subpaths(atPath: rootPath) {
    
    let sourcePath = rootPath + "/SharedTestCode.swift"
    
    do {

        let sharedCode = try String(contentsOfFile: sourcePath)

        for path in paths.filter({ $0.hasSuffix("Test.swift") }) {

            do {

                let fullPath = rootPath + "/\(path)"
        
                let fileContent = try String(contentsOfFile:fullPath)
                
                let components = fileContent.components(separatedBy: "//~~~**~~~")
                
                if components.count == 3 {
                    
                    let newContent = components[0] + sharedCode + components[2]
                    
                    do {
                        
                        try newContent.write(toFile: fullPath, atomically: true, encoding: String.Encoding.utf8)
                    }
                }
            }
            
        }

    }
    
    catch {
        
        print("ERROR: ........... ")
    }
    
    
}

