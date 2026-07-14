all: check

whiskers_less:
  whiskers shapez.less.tera

less: whiskers_less
  lessc "less/latte.less" "css/latte.css"
  lessc "less/frappe.less" "css/frappe.css"
  lessc "less/macchiato.less" "css/macchiato.css"
  lessc "less/mocha.less" "css/mocha.css"

format: less
  sed -i '/\/\* deno-fmt-ignore \*\//d' css/*.css

whiskers_js: format
  whiskers shapez.js.tera

check: whiskers_js
  whiskers --check themes/catppuccin-latte.js shapez.js.tera
  whiskers --check themes/catppuccin-frappe.js shapez.js.tera
  whiskers --check themes/catppuccin-macchiato.js shapez.js.tera
  whiskers --check themes/catppuccin-mocha.js shapez.js.tera

  whiskers --check less/latte.less shapez.less.tera
  whiskers --check less/frappe.less shapez.less.tera
  whiskers --check less/macchiato.less shapez.less.tera
  whiskers --check less/mocha.less shapez.less.tera
