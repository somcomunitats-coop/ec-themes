<#outputformat "plainText">
<#assign requiredActionsText><#if requiredActions??><#list requiredActions><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#sep></#items></#list></#if></#assign>
</#outputformat>

<html>
<body>
${kcSanitize(msg("testEmailHtml",link, linkExpiration, realmName, requiredActionsText, linkExpirationFormatter(linkExpiration), user.getUsername(), user.getFirstName()))?no_esc}
</body>
</html>
