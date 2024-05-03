<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        <div class="img-wrapper">
            <img src="${url.resourcesPath}/img/Logo.jpg" alt="One Piece" />
        </div>
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <p class="instructions">${msg("emailInstruction")}</p>
        <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                    <input
                      type="text"
                      id="username"
                      name="username"
                      placeholder="${msg("username")}"
                      class="${properties.kcInputClass!}"
                      autofocus
                      value="${(auth.attemptedUsername!'')}"
                      aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                    />
                    <#if messagesPerField.existsError('username')>
                        <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                        </span>
                    </#if>
            </div>
            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">

                <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
                </div>
                <div class="centered-element">
                    <span><p class="new-in-app"> ${msg("newInThisApp")} <a class="link" tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("newInThisAppHelper")}</a></p></span>
                </div>

                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="centered-element">
                        <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>
            </div>

        </form>

    <#elseif section = "info" >
    </#if>
</@layout.registrationLayout>
