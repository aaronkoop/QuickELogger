//Copyright (c) 2019 Ryan Baumbach <github@ryan.codes>
//
//Permission is hereby granted, free of charge, to any person obtaining
//a copy of this software and associated documentation files (the
//"Software"), to deal in the Software without restriction, including
//without limitation the rights to use, copy, modify, merge, publish,
//distribute, sublicense, and/or sell copies of the Software, and to
//permit persons to whom the Software is furnished to do so, subject to
//the following conditions:
//
//The above copyright notice and this permission notice shall be
//included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import Foundation

public struct LogMessage: Equatable, Codable {
    var id: String
    var timeStamp: Date
    var type: LogType
    var message: String
}

public enum LogType: String, Equatable, Codable {
    case verbose
    case info
    case debug
    case warn
    case error
}

public protocol QuickELoggerProtocol {
    func log(message: String, type: LogType)
}

public class QuickELogger: NSObject, QuickELoggerProtocol {
    // MARK: - Readonly properties
    
    public let filename: String
    
    // MARK: - Private properties
    
    private let engine: QuickELoggerEngineProtocol
    
    // MARK: - Init methods
    
    public init(filename: String = "QuickELogger") {
        self.filename = filename
        self.engine = QuickELoggerEngine(filename: filename)
    }
    
    // MARK: - Public methods
    
    public func log(message: String, type: LogType) {
        engine.log(message: message, type: type, currentDate: Date())
    }
}
