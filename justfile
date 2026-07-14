all: check

whiskers_less:
  whiskers templates/shapez.less.tera

less: whiskers_less
  lessc "less/latte.less" "css/latte.css"
  lessc "less/frappe.less" "css/frappe.css"
  lessc "less/macchiato.less" "css/macchiato.css"
  lessc "less/mocha.less" "css/mocha.css"

format: less
  sed -i '/\/\* deno-fmt-ignore \*\//d' css/*.css

whiskers_js: format
  whiskers templates/shapez.js.tera

check: whiskers_js
  whiskers --check themes/catppuccin-latte.js templates/shapez.js.tera
  whiskers --check themes/catppuccin-frappe.js templates/shapez.js.tera
  whiskers --check themes/catppuccin-macchiato.js templates/shapez.js.tera
  whiskers --check themes/catppuccin-mocha.js templates/shapez.js.tera

  whiskers --check less/latte.less templates/shapez.less.tera
  whiskers --check less/frappe.less templates/shapez.less.tera
  whiskers --check less/macchiato.less templates/shapez.less.tera
  whiskers --check less/mocha.less templates/shapez.less.tera
