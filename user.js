// MogSer initial privacy profile defaults.
// Place in a NEW test profile only. These preferences may change between Firefox releases.

// Opt out of telemetry / data submission.
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);

// Tracking protection.
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.pbmode.enabled", true);
user_pref("privacy.trackingprotection.cryptomining.enabled", true);
user_pref("privacy.trackingprotection.fingerprinting.enabled", true);

// HTTPS-only mode (all windows).
user_pref("dom.security.https_only_mode", true);

// Resist common fingerprinting vectors. Compatibility testing is required.
user_pref("privacy.resistFingerprinting", true);

// Disable sponsored/new-tab content and recommendation surfaces.
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);

// Do not disable automatic browser or security component updates.
// Do not hard-code a DoH provider here yet: provider choice, jurisdiction,
// fallback behavior and bootstrap DNS need a documented threat model.
