all: check

whiskers_less:
  whiskers templates/less/shapez.tera

whiskers_less_mods: whiskers_less
  whiskers templates/less/mods.tera

less: whiskers_less_mods
  lessc "less/latte.less" "css/latte.css"
  lessc "less/frappe.less" "css/frappe.css"
  lessc "less/macchiato.less" "css/macchiato.css"
  lessc "less/mocha.less" "css/mocha.css"

  lessc "less/mods/latte.less" "css/mods/latte.css"
  lessc "less/mods/frappe.less" "css/mods/frappe.css"
  lessc "less/mods/macchiato.less" "css/mods/macchiato.css"
  lessc "less/mods/mocha.less" "css/mods/mocha.css"

format: less
  sed -i '/\/\* deno-fmt-ignore \*\//d' css/**/*.css

whiskers_js: format
  whiskers templates/js/shapez.tera

check: whiskers_js
  whiskers --check themes/catppuccin-latte.js templates/js/shapez.tera
  whiskers --check themes/catppuccin-frappe.js templates/js/shapez.tera
  whiskers --check themes/catppuccin-macchiato.js templates/js/shapez.tera
  whiskers --check themes/catppuccin-mocha.js templates/js/shapez.tera

  whiskers --check less/latte.less templates/less/shapez.tera
  whiskers --check less/frappe.less templates/less/shapez.tera
  whiskers --check less/macchiato.less templates/less/shapez.tera
  whiskers --check less/mocha.less templates/less/shapez.tera
