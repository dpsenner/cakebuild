var target = Argument("Target", "Default");

Task("Default")
	.Does(() =>
	{
		Information("Ran target: Default");
	});

Task("Hello-World")
	.Does(() =>
 	{
		Information("Ran target: Hello-World");
	});	

RunTarget(target);
