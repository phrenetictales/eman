<div id="login">
  <form method="POST">
    <label for="login">Login</label>
    <input name="login">
    <label for="password">Password</label>
    <input type="password" name="password">
    <label for="submit"></label>
    <input type="submit" value="Login">
  </form>
</div>
<div style="clear:both"></div>
{{#flash.error}}
<div id="error">
  <h3>{{title}}</h3>
  <p>{{message}}</p>
</div>
{{/flash.error}}
