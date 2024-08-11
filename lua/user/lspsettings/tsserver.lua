local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

--from https://github.com/vuejs/language-tools?tab=readme-ov-file#community-integration
-- The "Take Over" mode has been discontinued. 
-- Instead, a new "Hybrid" mode has been introduced. 
-- In this mode, the Vue Language Server exclusively manages the CSS/HTML sections. 
-- As a result, you must run @vue/language-server in conjunction with a TypeScript server that employs @vue/typescript-plugin.
-- Below is a streamlined configuration for Neovim's LSP, updated to accommodate the language server following the upgrade to version 2.0.0.

return {
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}
