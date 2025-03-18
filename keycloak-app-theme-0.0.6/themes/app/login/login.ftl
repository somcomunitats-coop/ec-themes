<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <img src="${url.resourcesPath}/img/SomComunitatsLogo.png" alt="One Piece" />
    <#elseif section = "form">
    <div id="kc-form">
      <div id="kc-form-wrapper">
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}&ui_locales=ca" method="post">
                <#if !usernameHidden??>
                    <div class="${properties.kcFormGroupClass!}">

                        <input
                            tabindex="1"
                            placeholder="${msg("username")}"
                            id="username"
                            class="${properties.kcInputClass!} <#if messagesPerField.existsError('username','password')>input-error<#else>input</#if>"
                            name="username"
                            value="${(login.username!'')}"
                            type="text"
                            autofocus
                            autocomplete="off"
                        />


                    </div>
                </#if>

                <div class="${properties.kcFormGroupClass!}">

                    <div id="<#if messagesPerField.existsError('username','password')>password-wrapper-error<#else>password-wrapper</#if>">
                        <input
                            class="input"
                            tabindex="2"
                            placeholder="${msg("password")}"
                            id="password"
                            name="password"
                            type="password"
                            autocomplete="off"
                            aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        />
                        <i class="fa fa-eye" id="togglePassword"></i>
                    </div>
                    <#if messagesPerField.existsError('username','password')>
                        <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </span>
                    </#if>

                </div>

                </div>

                <div class="${properties.kcFormOptionsWrapperClass!}">
                    <#if realm.resetPasswordAllowed>
                        <span><a class="link" tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                    </#if>
                </div>
                <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                </div>
                <div class="${properties.kcFormOptionsWrapperClass!}">
                    <span><p class="new-in-app"> ${msg("newInThisApp")} <a class="link" tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("newInThisAppHelper")}</a></p></span>
                </div>
            </form>
        </#if>
        </div>

    </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="6"
                                                 href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    <#elseif section = "socialProviders" >
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <hr/>
                <h4>${msg("identity-provider-login-label")}</h4>

                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                type="button" href="${p.loginUrl}">
                            <#if p.iconClasses?has_content>
                                <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                            <#else>
                                <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                            </#if>
                        </a>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
