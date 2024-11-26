local leap = require('leap')

leap.setup({
	opts = {
		special_keys = {
			prev_target = '<bs>', 
			prev_group = '<bs>'
		}
	}
})

leap.add_default_mappings()
