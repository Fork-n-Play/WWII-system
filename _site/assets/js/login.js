(function() {
  localStorage.clear();

  document.getElementById("submit").addEventListener('click', function(e) {
    var but, val;
    val = document.getElementById("token").value;
    but = document.getElementById("submit");
    if (val) {
      but.setAttribute("disabled", "true");
      localStorage.setItem("player.token", btoa(val));
    }
  });

}).call(this);
