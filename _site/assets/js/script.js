(function() {
  var REPO, octo, redirect, token;

  if (localStorage.getItem("player.token")) {
    token = localStorage.getItem("player.token");
    octo = new Octokat({
      token: atob(token)
    });
    REPO = octo.repos("Fork-n-Play/WWII-system");
    REPO.contents('_config.yaml').fetch({
      ref: 'gh-pages'
    }).then(function(yml) {
      var a, f;
      f = atob(yml.content);
      a = jsyaml.load(f);
      return console.log(a);
    }).then(null, function(err) {
      return redirect;
    });
  } else {
    redirect;
  }

  redirect = function() {
    return window.location = '/WWII-system/login/';
  };

}).call(this);
