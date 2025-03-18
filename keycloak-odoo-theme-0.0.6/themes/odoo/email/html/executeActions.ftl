<#outputformat "plainText">
<#assign requiredActionsText><#if requiredActions??><#list requiredActions><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#sep></#items></#list></#if></#assign>
</#outputformat>

<html>
<body>
<#if user.attributes.lang=='ca_ES'>
${kcSanitize(msg("executeActionsBodyHtml",link, linkExpiration, realmName, requiredActionsText, linkExpirationFormatter(linkExpiration), user.username, user.getFirstName()))?no_esc}
<#else>
${kcSanitize(msg("executeActionsBodyHtml_es",link, linkExpiration, realmName, requiredActionsText, linkExpirationFormatter(linkExpiration), user.username, user.getFirstName()))?no_esc}
</#if>
</body>
</html>
