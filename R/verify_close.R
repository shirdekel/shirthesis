##' @title Insert verify close JS function
##'
##' From Bruce Burns 23/07/20

##' @return An object of class "json"
##' @author Shir Dekel
##' @export
verify_close <- function() {
    jaysire::insert_javascript(
        'var safe_to_close_window = false;
function verifyClose() {
  if (safe_to_close_window == false) {
    event.returnValue = "Are you sure you want to exit? Your data has not been saved yet.";
  }
}
window.onbeforeunload = verifyClose;
'
    )
}
