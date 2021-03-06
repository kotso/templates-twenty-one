<div class="content-container">

    {if $appLogo}
        <div class="app-logo">
            <img src="{$appLogo}" />
        </div>
    {/if}

    <h2 class="text-center">{lang key='oauth.loginToGrantApp' appName=$appName}</h2>

    <form method="post" action="{$issuerurl}dologin.php" role="form">
        <div class="content-padded">

            {if $incorrect}
                {include file="$template/includes/alert.tpl" type="error" msg="{lang key='loginincorrect'}" textcenter=true}
            {/if}

            <div class="form-group">
                <label for="inputEmail">{lang key='clientareaemail'}</label>
                <input type="email" name="username" class="form-control" id="inputEmail" placeholder="{lang key='enteremail'}" autofocus>
            </div>

            <div class="form-group">
                <label for="inputPassword">{lang key='clientareapassword'}</label>
                <input type="password" name="password" class="form-control" id="inputPassword" placeholder="{lang key='clientareapassword'}" autocomplete="off" >
            </div>

        </div>

        <div class="action-buttons">
            <div class="float-left">
                <div class="form-check">
                    <label>
                        <input type="checkbox" class="form-check-input" name="rememberme" /> {lang key='loginrememberme'}
                    </label>
                    &bull;
                    <a href="{routePath('password-reset-begin')}">{lang key='forgotpw'}</a>
                </div>
            </div>
            <button type="submit" class="btn btn-primary" id="btnLogin">
                {lang key='login'}
            </button>
            <button type="button" class="btn btn-default" id="btnCancel" onclick="jQuery('#frmCancelLogin').submit()">
                {lang key='cancel'}
            </button>
        </div>

    </form>

</div>

<form method="post" action="{$issuerurl}oauth/authorize.php" id="frmCancelLogin">
    <input type="hidden" name="login_declined" value="yes"/>
    <input type="hidden" name="request_hash" value="{$request_hash}"/>
</form>
