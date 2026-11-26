# MogSer

MogSer is an experimental, privacy-first Firefox-based browser project.

## Status

This is the first source/configuration scaffold, **not yet a finished or independently audited browser**. It builds the upstream Firefox application with a MogSer configuration layer. The first milestone is a reproducible local development build; deeper UI and Gecko changes come later.

## Architecture

- `browser/firefox-source/`: upstream Mozilla Firefox source checkout (created by bootstrap script)
- `configuration/`: enterprise policy and profile defaults
- `core/`: planned privacy, security, networking and performance changes
- `interface/`: planned browser UI customizations
- `extensions/`: planned bundled content blocker
- `sync/`: planned end-to-end encrypted sync
- `tests/`: privacy/security acceptance tests
- `scripts/`: source bootstrap and build helpers

## Build prerequisites

Building Firefox is resource-intensive. Mozilla's current Linux guide lists 4 GB RAM minimum, 8 GB+ recommended, and at least 30 GB free disk. A full build can require substantially more disk and time. Build separately on each target OS; a Windows build does not produce macOS/Linux binaries.

Use Mozilla's official platform-specific instructions:
- https://firefox-source-docs.mozilla.org/setup/index.html
- Windows: https://firefox-source-docs.mozilla.org/setup/windows_build.html
- macOS: https://firefox-source-docs.mozilla.org/setup/macos_build.html
- Linux: https://firefox-source-docs.mozilla.org/setup/linux_build.html

## Quick start

1. Install the platform prerequisites from Mozilla's guide.
2. Run the bootstrap script for your OS.
3. In the Firefox source directory, run `./mach build` (or `mach.bat build` in the MozillaBuild shell on Windows).
4. Run `./mach run` (or `mach.bat run`) to launch the development build.
5. Copy `configuration/policies.json` into the built application's `distribution/` directory before packaging, following Mozilla's platform packaging layout.
6. For profile preferences, copy `configuration/user.js` into a dedicated MogSer test profile. Do not use your everyday browser profile.

## Important security notes

- No browser can promise "unhackable" or perfectly untrackable operation.
- `DisableTelemetry` disables Firefox telemetry upload through the supported enterprise policy; it does not mean the browser makes no network requests. Updates, certificate revocation, Safe Browsing, Remote Settings, extension updates and normal browsing may still contact services.
- Do not disable security updates, certificate checks, Safe Browsing or Remote Settings merely to reduce network activity. Audit each service and make an informed, documented choice.
- Strict anti-fingerprinting can break websites. Test compatibility before making settings mandatory.
- Do not advertise MogSer as secure until independent audits, update signing, reproducible-build verification and a vulnerability-response process exist.

## Licensing

Firefox is primarily distributed under the Mozilla Public License 2.0, with components under other licenses. Preserve all upstream notices and comply with each component's license. MogSer-specific code should use a clearly documented OSI-approved license. See `LICENSE`.
