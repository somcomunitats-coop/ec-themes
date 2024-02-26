function getQueryParamValue(url, paramName) {
  const params = new URLSearchParams(new URL(url).search);
  return params.get(paramName);
}

function getUserBrowserLanguage() {
  const userLanguage = navigator.language || navigator.userLanguage;
  return userLanguage.split("-")[0]; // Extract language code (e.g., "en" from "en-US")
}

function reloadWithLocaleQueryParam(locale) {
  const currentURL = window.location.href;
  const existingLocale = getQueryParamValue(currentURL, "ui_locales");

  if (!existingLocale) {
    const delimiter = currentURL.includes("?") ? "&" : "?";
    const newURL = `${currentURL}${delimiter}ui_locales=${locale}`;
    window.location.href = newURL;
  }
}

// Get user's browser language and reload with kc_locale parameter if needed
const userLanguage = getUserBrowserLanguage();
reloadWithLocaleQueryParam(userLanguage);