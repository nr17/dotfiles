" Remove any old syntax stuff hanging around
syn clear
 
syn match logCritical        "CRITICAL.*"
syn match logError           "ERR.*"
syn match logError           "FAIL.*"
syn match logWarning         "WARNING.*"
syn match logWarning         "WRN"
syn match logInfo            "INF.*"
syn match logTrace           "TRC.*"
syn match logTrace           "DEB*"
 
if !exists("did_log_syntax_inits")
  let did_log_syntax_inits = 1
 
  hi link logCritical        ErrorMsg
  hi link logError           Constant
  hi link logWarning         Identifier
  hi link logInfo            Comment
  hi link logTrace           Special
 
endif
 
let b:current_syntax = "log"
