# Use software collections on CentOS/RHEL
_COLLECTIONS=(rh-python35 rh-postgresql95)


_load_collections() {
    local COLLECTION
    local CONF

    if [[ -f /etc/redhat-release ]]
    then
        for COLLECTION in ${_COLLECTIONS[@]}
        do
            CONF=/etc/scl/conf/$COLLECTION

            if [[ -e $CONF ]]
            then
                source $(cat $CONF)/$COLLECTION/enable
            fi
        done
    fi
}


_load_collections
