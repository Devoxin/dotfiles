EX_RES=$(pip3.6 list -o --format=columns | cut -d " " -f 1)
if [ -z "$EX_RES" ]; then
    echo "No packages need updating."
else
    PACKAGES=$(echo "$EX_RES" | tail -n +3)
    PACKAGE_COUNT=$(echo "$PACKAGES" | wc -l)

    echo "=== Updating $PACKAGE_COUNT packages... ==="
    for package in $PACKAGES
    do
        echo -n "Updating $package... "
        OUTPUT=$(pip3.6 install --upgrade $@ $package 2>&1)
        EXIT_CODE=$?

        if [ $EXIT_CODE -ne 0 ]; then
            echo "ERR"
            echo $OUTPUT
            exit $EXIT_CODE
        else
            echo "OK"
        fi
    done
fi
