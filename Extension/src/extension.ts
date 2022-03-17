import * as vscode from 'vscode';
var nbind = require('nbind');
var lib = nbind.init().lib;

function compile(JSON: String){

}
export function activate(context: vscode.ExtensionContext) {
	var log = lib.Main.installPlugin()
	if (log == ""){
		console.log('Successfully installed!');
	}else{
		console.error('Error installing plugin. '.concat(log));
		if (log == "Unable to find RBLX Install path."){
			console.error("Please download the plugin via: https://github.com/coolpro200021/ro-code")
		}
	}
	const disposable = vscode.commands.registerCommand('extension.initialize', () => {
		var code = lib.Main.newCode();
		vscode.window.showInformationMessage('Your new connection code is '.concat(code));

		while (lib.Main.getData() == " ") {}

		console.log("Ro-Code is now active!")

		lib.Main.build(compile(lib.Main.getData()))
	});
	const disposable2 = vscode.commands.registerCommand('extension.command', () => {
		vscode.window.showInformationMessage('Running command.');
	});

	context.subscriptions.push(disposable);
	context.subscriptions.push(disposable2);
}