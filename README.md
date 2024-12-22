# Play Integrity Destroyer

This module tries to fix Play Integrity and SafetyNet verdicts to get a valid attestation by completely deleting all partitions on your device.

## NOTE

This module is not made to hide root, nor to avoid detections in other apps. It only serves to try to attempt to pass Device verdict in the Play Integrity tests and certify your device by uninstalling all partitions, effectively bricking it.
All issues created to report a non-Google app not working will be closed without notice.

## Tutorial

You will need root and Zygisk, so you must choose ONE of this three setups:

- [Magisk](https://github.com/topjohnwu/Magisk) with Zygisk enabled.
- [KernelSU](https://github.com/tiann/KernelSU) with [ZygiskNext](https://github.com/Dr-TSNG/ZygiskNext) module installed.
- [APatch](https://github.com/bmax121/APatch) with [ZygiskNext](https://github.com/Dr-TSNG/ZygiskNext) module installed.

After flashing and reboot your device, and see if the module worked for you!

## EXTREMELY IMPORTANT!

I AM NOT RESPONSIBLE FOR ANY ISSUE WITH YOUR DEVICE, EVEN IF YOU BRICK IT, YOU HAVE BEEN WARNED!
PLEASE DO NOT TRUST RANDOM MODULES!

## Verdicts

After requesting an attestation, you should get this result:

- MEETS_BASIC_INTEGRITY   ✅
- MEETS_DEVICE_INTEGRITY  ✅
- MEETS_STRONG_INTEGRITY  ❌
- MEETS_VIRTUAL_INTEGRITY ❌ (this is for emulators only)

You can know more about verdicts in this post: https://xdaforums.com/t/info-play-integrity-api-replacement-for-safetynet.4479337/

And in SafetyNet you should get this:

- basicIntegrity:  true
- ctsProfileMatch: true
- evaluationType:  BASIC

## Download
https://github.com/ukriu/PlayIntegrityDestroyer/releases/latest
