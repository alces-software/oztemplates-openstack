oz-install -d3 -u centos-minimal.tdl -x centos-minimal.xml -p -a centos-minimal.auto -c ../../config/oz.cfg
virt-sysprep -a /var/lib/libvirt/images/centos7.0-minimal.qcow2
