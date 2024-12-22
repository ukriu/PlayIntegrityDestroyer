# Don't flash in recovery!
if ! $BOOTMODE; then
    ui_print "*********************************************************"
    ui_print "! Install from recovery is NOT supported"
    ui_print "! Recovery sucks"
    ui_print "! Please install from Magisk / KernelSU / APatch app"
    abort    "*********************************************************"
fi

# Error on < Android 8
if [ "$API" -lt 26 ]; then
    abort "! You can't use this module on Android < 8.0"
fi

check_zygisk() {
    local ZYGISK_MODULE="/data/adb/modules/zygisksu"
    local MAGISK_DIR="/data/adb/magisk"
    local ZYGISK_MSG="Zygisk is not enabled. Switching to No-Zygisk mode!"

    # Check if Zygisk module directory exists
    if [ -d "$ZYGISK_MODULE" ]; then
        return 0
    fi

    # If Magisk is installed, check Zygisk settings
    if [ -d "$MAGISK_DIR" ]; then
        # Query Zygisk status from Magisk database
        local ZYGISK_STATUS
        ZYGISK_STATUS=$(magisk --sqlite "SELECT value FROM settings WHERE key='zygisk';")

        # Check if Zygisk is disabled
        if [ "$ZYGISK_STATUS" = "value=0" ]; then
            echo "$ZYGISK_MSG"
            return 1
        fi
    else
        echo "$ZYGISK_MSG"
        return 1
    fi
}

# Module requires Zygisk to work
check_zygisk

# Continue running the rest of the script
echo "- Continuing with Play Integrity Destruction..."

sleep 1
echo "- Supressing GMS Services..."

sleep 1
echo "- Extracting required Play Integrity files..."

sleep 4
echo "- Extraction Complete!"
echo "- Continue Patching Play Integrity API.."

sleep 3
echo "- Adding Labels: 'MEETS_BASIC_INTEGRITY', 'MEETS_DEVICE_INTEGRITY', 'MEETS_STRONG_INTEGRITY'"

sleep 2
echo "- Saving changes"

sleep 2
echo "- Recompiling Play Integrity"

sleep 1
echo "- Finishing up.."
echo "- Caches Cleared!"
echo "- Unwanted traces removed!"
echo "- GMS Services re-killed!"
echo "------------------------------------------"
echo "Installation complete!"
echo "Please reboot to restart GMS services with Patched Play Integrity!"
echo "           "
echo "          "

echo "You have gotten scammed. Please Uninstall this module and DO NOT CLICK REBOOT."
echo "READ what a module does BEFORE installing it!"
echo "You COULD have avoided almost killing your device if you read the README on ukriu/PlayIntegrityDestroyer"
