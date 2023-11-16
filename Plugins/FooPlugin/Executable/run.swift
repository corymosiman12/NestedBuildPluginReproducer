import Foundation

@main
enum FooPlugin {
    static func main() throws {
        // arguments[0] is the path to this command line tool
        let outputFile = URL(fileURLWithPath: CommandLine.arguments[1])
        
        let code = """
        var fooThing = 1
        """

        let data = Data(code.utf8)
        try data.write(to: outputFile, options: .atomic)
    }
}
