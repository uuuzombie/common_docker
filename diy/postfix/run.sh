#!/bin/bash

service postfix start
#tail -f /var/log/mail.log
tail -n0 -F /var/log/mail.log