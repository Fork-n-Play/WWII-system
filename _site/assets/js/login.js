(function() {
  localStorage.clear();

  document.getElementById("submit").addEventListener('click', function(e) {
    var but, val;
    val = document.getElementById("token").value;
    but = document.getElementById("submit");
    if (val) {
      but.setAttribute("disabled", "true");
      localStorage.setItem("player.token", btoa(val));
      setInterval(function() {
        window.location = '/WWII-system/';
        window.location.reload(true);
      }, 500);
    }
  });

}).call(this);
