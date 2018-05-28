var target = Argument("Target", "Default");

Task("Default")
	.Does(() =>
	{
		Information("Hello world!");
	});

RunTarget(target);
