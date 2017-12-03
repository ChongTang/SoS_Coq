#!/usr/bin/env python
'''
This script call coqc to verify a generated configuration.
Return:
    True: valid with respect to constrains
    False: invalid
'''
import sys
import os
import subprocess

checker_home = '/home/ct4ew/Dropbox/FSE18/Formal_confspace/SoS_Coq/bin'

def run_shell_cmd(cmd):
    FNULL = open(os.devnull, 'w')
    p = subprocess.Popen(cmd.split(' '), cwd=checker_home, stdout=FNULL, stderr=subprocess.STDOUT)
    p.wait()
    ret_code = p.returncode
    FNULL.close()
    if ret_code != 0:
        return False
    return True


conf_file = sys.argv[1]
checker_home = sys.argv[2]
# copy conf_file to check home
tmp_conf_name = 'tmp_conf.v'
copy_cmd = 'cp ' + conf_file + ' ' + checker_home + os.sep + tmp_conf_name
run_shell_cmd(copy_cmd)
# verify
verify_cmd = 'coqc -R . Top ' + tmp_conf_name
is_valid = run_shell_cmd(verify_cmd)
# is_valid: a boolean value indicating whether the given configuration is valid
print is_valid

# delete tmp configuration file
delete_cmd = 'rm -rf ' + checker_home + os.sep + tmp_conf_name
run_shell_cmd(delete_cmd)
