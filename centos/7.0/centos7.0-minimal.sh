#!/bin/bash
################################################################################
# (c) Copyright 2007-2014 Alces Software Ltd                                   #
#                                                                              #
# Symphony Software Toolkit                                                    #
#                                                                              #
# This file/package is part of Symphony                                        #
#                                                                              #
# Symphony is free software: you can redistribute it and/or modify it under    #
# the terms of the GNU Affero General Public License as published by the Free  #
# Software Foundation, either version 3 of the License, or (at your option)    #
# any later version.                                                           #
#                                                                              #
# Symphony is distributed in the hope that it will be useful, but WITHOUT      #
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        #
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License #
# for more details.                                                            #
#                                                                              #
# You should have received a copy of the GNU Affero General Public License     #
# along with Symphony.  If not, see <http://www.gnu.org/licenses/>.            #
#                                                                              #
# For more information on the Symphony Toolkit, please visit:                  #
# http://www.alces-software.org/symphony                                       #
#                                                                              #
################################################################################

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#What to call the image in libvirt
if [ -z $IMAGE_NAME ]; then
  IMAGE_NAME=centos7.0-minimal
fi

#Primary disk size in GB
if [ -z $IMAGE_SIZE ]; then
  IMAGE_SIZE=8
fi

#QCOW2 pool path
if [ -z $POOL_PATH ]; then
  POOL_PATH=/opt/vm
fi

#OZ config file
if [ -z $OZ_CONFIG ]; then
  echo "OZ_CONFIG not set, please set OZ_CONFIG env variable" >&2 
  exit 1
fi

TDL=/tmp/tdl.$$

sed -e "s|%DISKSIZE%|$IMAGE_SIZE|g"  \
    -e "s|%NAME%|$IMAGE_NAME|g" $DIR/centos7.0-minimal.tdl.template > $TDL

oz-install -d3 -u $TDL -x $POOL_PATH/$IMAGE_NAME.xml -p -a $DIR/centos7.0-minimal.auto -c $OZ_CONFIG
virt-sysprep -a $POOL_PATH/$IMAGE_NAME.qcow2

rm $TDL
