---
---

# Clear localStorage
localStorage.clear()

# Wait for token
document.getElementById("submit").addEventListener('click', (e) ->
  val = document.getElementById("token").value
  but = document.getElementById("submit")
  if val
    but.setAttribute("disabled", "true")
    localStorage.setItem("player.token", btoa(val))
    # setInterval ->
    #   window.location = '{{ site.baseurl }}/'
    #   window.location.reload(true)
    #   return
    # , 500
  return
)
