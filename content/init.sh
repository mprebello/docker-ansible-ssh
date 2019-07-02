#!/bin/bash
function main() {
  done_file=/etc/.done
  if [ ! -e done_file ]
  then
    ansible_default_dirs="/etc/ansible /etc/ansible/roles /etc/ansible/group_vars"
    ansible_roles_src_dir="/usr/src/ansible-modules-scripts/code"
    ansible_roles_src_vars_dir="/usr/src/default_variables"
    ansible_conf_dir="/etc/ansible"
    createDefaultFolder
    syncRoles
    copyDefaultVariablesPython
    alreadyDone
  fi
  initSshDaemon
}

function alreadyDone() {
  echo "done" >/etc/.done
}

function createDefaultFolder() {
  for dir_now in ${ansible_default_dirs}
  do
    if [ ! -e ${dir_now} ]
    then
      mkdir ${dir_now}
    fi
  done
}

function copyDefaultVariablesPython(){
  variables="roles/CommonTasks/scripts/Information/openticket.csv "
  variables+="roles/CommonTasks/scripts/ManageHostDetails/config_vars_host_details.py "
  variables+="roles/CommonTasks/scripts/ManageReport/report_config_vars.py "
  variables+="roles/CommonTasks/scripts/ManageWarpTicket/config_vars.py "
  variables+="roles/CommonTasks/scripts/SendMail/config_vars.py "
  variables+="roles/CommonTasks/vars/main.yml "
  variables+="hosts "
  variables+="ansible.cfg "
  variables+="group_vars/linux-example.yml "
  variables+="group_vars/windowslocal-example.yml "
  variables+="group_vars/windowsdomain-example.yml "

  for variable in ${variables}
  do
    if [ ! -e  ${ansible_conf_dir}/${variable} ]
    then
      cp ${ansible_roles_src_vars_dir}/${variable} ${ansible_conf_dir}/${variable}
    fi
  done
}

function syncRoles(){
  rsync -a ${ansible_roles_src_dir}/* ${ansible_conf_dir}/roles/
}

function initSshDaemon(){
  mkdir -p /var/run/sshd
  /usr/sbin/sshd -D
}

main

