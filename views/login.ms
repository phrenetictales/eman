<div id="login">
  <form method="POST">
    <label for="login">Login</label>
    <input name="login">
    <label for="password">Password</label>
    <input type="password" name="password">
    <label for="submit"></label>
    <input type="submit" value="Login">
  </form>
  {{#flash.error}}
  <div id="error">
    <h1>{{title}}</h1>
    <p>{{message}}</p>
  </div>
  {{/flash.error}}
</div>
