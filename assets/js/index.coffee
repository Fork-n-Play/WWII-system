---
---
# Check player logged
login = (token) ->
  if localStorage.getItem "player.token"
    # Load data.yaml from gh-pages
    token = localStorage.getItem "player.token"
    octo = new Octokat { token: atob token }
    REPO = octo.repos "{{ site.owner }}{{ site.baseurl }}"
    REPO.contents('_config.yaml').read({ref: 'gh-pages'})
    .then (yml) ->
      if yml
        a = jsyaml.load yml
        console.log a
        console.log jsyaml.dump a # reverse to yml
      return
  else redirect
  return

redirect = () -> # error function
  window.location = '{{ site.baseurl }}/login/'
  return

# Check player logged
login localStorage.getItem "player.token"
