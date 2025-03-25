#!/bin/sh

set -x
echo foo
diff <(sort a) <(sort b)
