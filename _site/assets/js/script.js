(function() {
  var REPO, octo, token;

  if (localStorage.getItem("player.token")) {
    token = localStorage.getItem("player.token");
    octo = new Octokat({
      token: atob(token)
    });
    REPO = octo.repos("Fork-n-Play/WWII-system");
    REPO.contents('_config.yaml').fetch({
      ref: 'gh-pages'
    }).then(function(yml) {
      return console.log(yml);
    }).then(null, function(err) {
      return window.location = '/WWII-system/login/';
    });
  } else {
    window.location = '/WWII-system/login/';
  }

}).call(this);
