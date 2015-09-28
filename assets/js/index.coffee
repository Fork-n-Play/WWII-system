---
---
# Check player logged
login = (token) ->
  if localStorage.getItem "player.token"
    # Load data.yaml from gh-pages
    token = localStorage.getItem "player.token"
    octo = new Octokat { token: atob token }
    REPO = octo.repos "{{ site.owner }}{{ site.baseurl }}"
    REPO.contents('_config.yaml').fetch {ref: 'gh-pages'}
    .then null, (err) -> redirect # error
    .then (yml) ->
      if yml.content
        f = atob yml.content
        console.log atob yml.content
        console.log 'logged', jsyaml.load f
        # a = jsyaml.load f
        # console.log a
        # console.log jsyaml.dump a # reverse to yml
      return
  else redirect
  return

redirect = () -> # error function
  window.location = '{{ site.baseurl }}/login/'
  return

# Check player logged
login localStorage.getItem "player.token"
