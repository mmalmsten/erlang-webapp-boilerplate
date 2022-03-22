{application, 'webapp', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['webapp_app','webapp_handler','webapp_sup']},
	{registered, [webapp_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{mod, {webapp_app, []}},
	{env, []}
]}.