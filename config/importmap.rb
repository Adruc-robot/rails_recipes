# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"


pin "jquery", to: "https://cdn.skypack.dev/jquery", preload: true
#pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.js", preload: true
#pin "datatables", to: "https://cdn.datatables.net/1.11.4/js/jquery.dataTables.js"
#pin "datatables", to: "https://cdn.skypack.dev/jquery"

#pin_all_from "app/javascript/custom", under: "custom"
#pin_all_from "app/javascript/src", under: "source"