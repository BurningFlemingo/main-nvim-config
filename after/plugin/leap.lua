local leap = require('leap')
leap.opts.special_keys.prev_target = '<bs>'
leap.opts.special_keys.prev_group = '<bs>'
require('leap.user').set_repeat_keys('<cr>', '<bs>')

leap.create_default_mappings()
