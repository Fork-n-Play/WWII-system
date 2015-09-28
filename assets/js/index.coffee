---
---
# Check player logged
if localStorage.getItem "player.token"
  # Load data.yaml from gh-pages
  token = localStorage.getItem "player.token"
  octo = new Octokat { token: atob token }
  REPO = octo.repos "{{ site.owner }}{{ site.baseurl }}"
  REPO.contents('_config.yaml').fetch {ref: 'gh-pages'}
  .then (yml) ->
    f = atob yml.content
    a = jsyaml.load f
    console.log a
    # console.log jsyaml.dump a # reverse to yml
  .then null, (err) -> redirect # error
else redirect

redirect = () -> # error function
  window.location = '{{ site.baseurl }}/login/'
