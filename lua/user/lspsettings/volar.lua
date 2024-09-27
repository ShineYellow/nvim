return {
   init_options = {
    typescript = {
      tsdk = os.getenv("HOME") .. '/.asdf/installs/nodejs/20.14.0/lib/node_modules/typescript/lib'
      -- Alternative location if installed as root:
      -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
    }
  },
}
