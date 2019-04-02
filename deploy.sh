#!/bin/sh

if [ x"${CCG_WEB_USER}" == x ]; then
  echo "Set \$CCG_WEB_USER env var before running this script."
  exit 1
fi

rsync -az public "${CCG_WEB_USER}@glendenin.com:webroot/chad.glendenin.com/"
