require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

//= require jquery
//= require jquery-ui
//= require jquery.turbolinks
//= require jquery_ujs
//= require_tree .

import "chosen-js"
import "../scripts/mana-script.js"
import "../scripts/onboarding.js"
import "../scripts/ajax-create-tag.js"
import "../scripts/ajax-create-room.js"
import "../scripts/ajax-create-user.js"
import "../scripts/ajax-create-issue.js"
import "../scripts/ajax-update-issue-status.js"
require("trix")
require("@rails/actiontext")