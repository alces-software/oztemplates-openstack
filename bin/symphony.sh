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
if [ -z $POOL_PATH ]; then
  . $DIR/../etc/vars
fi

export IMAGE_SIZE=32
BASE_IMAGE=$POOL_PATH/centos7.0-symphonybase.xml
#Create base image (if not exist)
if ! [ -f $BASE_IMAGE ]; then 
  $DIR/centos7.0.sh centos7.0-symphonybase
fi

INTERNAL_BRIDGE='build.sfn'
EXTERNAL_BRIDGE='dmz'

#SYMPHONY-DIRECTOR
virt-clone --original-xml=$BASE_IMAGE --name=symphony-director-v1.0 --file=$POOL_PATH/symphony-director-v1.0.qcow2 --force-copy=vda
virt-clone --original-xml=$BASE_IMAGE --name=symphony-monitor-v1.0 --file=$POOL_PATH/symphony-monitor-v1.0.qcow2 --force-copy=vda
virt-clone --original-xml=$BASE_IMAGE --name=symphony-repo-v1.0 --file=$POOL_PATH/symphony-repo-v1.0.qcow2 --force-copy=vda

