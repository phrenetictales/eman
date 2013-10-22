<div id="login">
  <form method="POST">
    <div>
      <label for="login" class="login">Login</label>
      <input type="text" name="login" class="login">
    </div>
    <div style="border-top: solid 1px grey; width: 100%; clear:both">
      <label for="password" class="password">Password</label>
      <input type="password" class="password" name="password">
    </div>
    <label for="submit" class="submit"></label>
    <input type="submit"  class="submit" value="Login">
  </form>
  <div style="clear:both"></div>
</div>

{{#flash.error}}
<div id="error">
  <h3>{{title}}</h3>
  <p>{{message}}</p>
</div>
{{/flash.error}}
