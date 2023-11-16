import Foundation
import PackagePlugin

@main
struct FooPlugin: BuildToolPlugin {
    func createBuildCommands(
        context: PackagePlugin.PluginContext,
        target _: PackagePlugin.Target
    ) async throws -> [PackagePlugin.Command] {
        let output = context.pluginWorkDirectory.appending("Foo.swift")
        
        return [
            .buildCommand(
                displayName: "Foo the Plugin",
                executable: try context.tool(named: "FooGeneratorExecutable").path,
                arguments: [output],
                outputFiles: [output]
            ),
        ]
    }
}
