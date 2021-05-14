##' @title Get consent trial

##' @return A "trial" object
##' @author Shir Dekel
##' @export
get_consent <- function() {
  consent <- jaysire::trial_generic(
    "external-html",
    url = jaysire::insert_resource("consent.html"),
    cont_btn = "start",
    check_fn = jaysire::insert_javascript("function(elem) {
  if (document.getElementById('consent_checkbox').checked) {
    return true;
  }
  else {
    alert('If you wish to participate, you must check the box next to the statement <em>I agree to participate in this study.</em>');
    return false;
  }
  return false;
}"),
    data = jaysire::insert_property(stage = "consent")
  )

  return(consent)
}
